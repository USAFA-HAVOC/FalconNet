import 'dart:convert';

import 'package:aad_oauth/helper/auth_storage.dart';
import 'package:aad_oauth/helper/core_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/failure.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:aad_oauth/request_token.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:falcon_net/Model/Store/Endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'FNRequestCode.dart';

class FNOAuth extends CoreOAuth {
  final AuthStorage authStorage;
  final FNRequestCode requestCode;
  final RequestToken requestToken;

  /// Instantiating MobileAadOAuth authentication.
  /// [config] Parameters according to official Microsoft Documentation.
  FNOAuth(Config config) :
        authStorage = AuthStorage(
          tokenIdentifier: config.tokenIdentifier,
          aOptions: config.aOptions,
        ),
        requestCode = FNRequestCode(config),
        requestToken = RequestToken(config);

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

  /// Retrieve cached OAuth Access Token.
  @override
  Future<String?> getAccessToken() async =>
      (await authStorage.loadTokenFromCache()).accessToken;

  /// Retrieve cached OAuth Id Token.
  @override
  Future<String?> getIdToken() async =>
      (await authStorage.loadTokenFromCache()).idToken;

  /// Perform Azure AD logout.
  @override
  Future<void> logout() async {
    await authStorage.clear();
    await requestCode.clearCookies();
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
    var token = await authStorage.loadTokenFromCache();

    if (!refreshIfAvailable) {
      if (token.hasValidAccessToken()) {
        return Right(token);
      }
    }

    if (token.hasRefreshToken()) {
      try {
        Response<String> res = await dio.get("/refresh_login",
            queryParameters: {"refresh_token": token.refreshToken!});
        return Right(Token.fromJson(json.decode(res.data!)));
      } catch (e) {
        token.accessToken = null;
        token.refreshToken = null;
      }
    }

    if (!token.hasValidAccessToken()) {
      final result = await _performFullAuthFlow();
      Failure? failure;
      result.fold(
        (l) => failure = l,
        (r) => token = r,
      );
      if (failure != null) {
        return Left(failure!);
      }
    }

    await authStorage.saveTokenToCache(token);
    return Right(token);
  }

  /// Authorize user via refresh token or web gui if necessary.
  Future<Either<Failure, Token>> _performFullAuthFlow() async {
    requestCode.clearCookies();
    var code = await requestCode.requestCode();
    if (code == null) {
      return Left(AadOauthFailure(
        ErrorType.AccessDeniedOrAuthenticationCanceled,
        'Access denied or authentication canceled.',
      ));
    }
    Response<String> res = await dio.get("/login", queryParameters: {"code": code});
    return Right(Token.fromJson(json.decode(res.data!)));
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