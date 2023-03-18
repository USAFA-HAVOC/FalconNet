import 'dart:convert';

import 'package:aad_oauth/helper/auth_storage.dart';
import 'package:aad_oauth/helper/core_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/failure.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:aad_oauth/request_code.dart';
import 'package:aad_oauth/request_token.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:universal_html/html.dart" as html;

class AuthService extends CoreOAuth {
  static final AuthService _authService = AuthService._internal();
  late final AuthStorage _authStorage;
  String? _code;
  late final RequestCode? _requestCode;
  late final RequestToken _requestToken;

  AuthService._internal();

  factory AuthService() => _authService;

  /// Instantiating MobileAadOAuth authentication.
  /// [config] Parameters according to official Microsoft Documentation.
  void init(Config config, String? code) {
    _authStorage = AuthStorage(
      tokenIdentifier: config.tokenIdentifier,
      aOptions: config.aOptions,
    );
    _requestCode = kIsWeb ? null : RequestCode(config);
    _requestToken = RequestToken(config);
    _code = code;
  }

  /// Perform Azure AD login.
  ///
  /// Setting [refreshIfAvailable] to `true` will attempt to re-authenticate
  /// with the existing refresh token, if any, even though the access token may
  /// still be valid. If there's no refresh token the existing access token
  /// will be returned, as long as we deem it still valid. In the event that
  /// both access and refresh tokens are invalid, the web gui will be used.
  @override
  Future<Either<Failure, Token>> login(
      {bool refreshIfAvailable = false}) async {
    await _removeOldTokenOnFirstLogin();
    return await _authorization(refreshIfAvailable: refreshIfAvailable);
  }

  void setCode(String? code) {
    _code = code;
  }

  /// Retrieve cached OAuth Access Token.
  @override
  Future<String?> getAccessToken() async =>
      (await _authStorage.loadTokenFromCache()).accessToken;

  /// Retrieve cached OAuth Id Token.
  @override
  Future<String?> getIdToken() async =>
      (await _authStorage.loadTokenFromCache()).idToken;

  /// Perform Azure AD logout.
  @override
  Future<void> logout() async {
    await _authStorage.clear();
    await _requestCode?.clearCookies();
  }

  /// Authorize user via refresh token or web gui if necessary.
  ///
  /// Setting [refreshIfAvailable] to [true] will attempt to re-authenticate
  /// with the existing refresh token, if any, even though the access token may
  /// still be valid. If there's no refresh token the existing access token
  /// will be returned, as long as we deem it still valid. In the event that
  /// both access and refresh tokens are invalid, the web gui will be used.
  Future<Either<Failure, Token>> _authorization(
      {bool refreshIfAvailable = false}) async {
    var token = await _authStorage.loadTokenFromCache();

    if (!refreshIfAvailable) {
      if (token.hasValidAccessToken()) {
        return Right(token);
      }
    }

    if (token.hasRefreshToken()) {
      try {
        Response<String> res = await dio.get("/refresh_login",
            queryParameters: {"refresh_token": token.refreshToken!});
        token = Token.fromJson(json.decode(res.data!));
      } catch (e) {
        token.accessToken = null;
        token.refreshToken = null;
      }
    }

    if (!token.hasValidAccessToken()) {
      final result = await _performFullAuthFlow();
      dynamic failure;
      result.fold(
        (l) => failure = l,
        (r) => token = r,
      );
      if (failure != null) {
        return Left(failure);
      }
    }

    await _authStorage.saveTokenToCache(token);
    return Right(token);
  }

  /// Authorize user via refresh token or web gui if necessary.
  Future<Either<Failure, Token>> _performFullAuthFlow() async {
    // _requestCode.clearCookies();
    if (kIsWeb) {
      if (_code != null) {
        return Right(Token.fromJson(json.decode(_code!)));
      }
      else {
        html.window.open('https://api.ethanchapman.dev/', "_self");
        return Left(AadOauthFailure(
          ErrorType.AccessDeniedOrAuthenticationCanceled,
          'Access denied or authentication canceled.',
        ));
      }
    } else {
      var code = await _requestCode?.requestCode();
      if (code == null) {
        return Left(AadOauthFailure(
          ErrorType.AccessDeniedOrAuthenticationCanceled,
          'Access denied or authentication canceled.',
        ));
      }
      Response<String> res = await dio.get("/login", queryParameters: {"code": code});
      return Right(Token.fromJson(json.decode(res.data!)));
    }
  }

  Future<void> _removeOldTokenOnFirstLogin() async {
    var prefs = await SharedPreferences.getInstance();
    const keyFreshInstall = 'freshInstall';
    if (!prefs.getKeys().contains(keyFreshInstall)) {
      await logout();
      await prefs.setBool(keyFreshInstall, false);
    }
  }
}