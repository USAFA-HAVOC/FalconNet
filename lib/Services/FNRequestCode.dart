import 'dart:async';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/request/authorization_request.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FNRequestCode {
  final AuthorizationRequest authorizationRequest;
  final String redirectUriHost;
  late NavigationDelegate navigationDelegate;
  final Config config;
  String? code;

  FNRequestCode(Config authConfig) :
    config = authConfig,
    authorizationRequest = AuthorizationRequest(authConfig),
    redirectUriHost = Uri.parse(authConfig.redirectUri).host {
      navigationDelegate = NavigationDelegate(
        onNavigationRequest: _onNavigationRequest,
      );
    }

  Future<String?> requestCode() async {
    code = null;
    final urlParams = _constructUrlParams();
    final launchUri = Uri.parse('${authorizationRequest.url}?$urlParams');
    final controller = WebViewController();
    await controller.setNavigationDelegate(navigationDelegate);
    await controller.setJavaScriptMode(JavaScriptMode.unrestricted);

    await controller.setBackgroundColor(Colors.transparent);
    await controller.setUserAgent(config.userAgent);
    await controller.loadRequest(launchUri);

    final webView = WebViewWidget(controller: controller);

    var router = GoRouter.of(config.navigatorKey.currentState!.context);
    router.push("/login", extra: webView);
    var completer = Completer<void>();
    router.routerDelegate.addListener(() {
      completer.complete();
    });
    await completer.future;
    return code;
  }

  Future<NavigationDecision> _onNavigationRequest(
      NavigationRequest request) async {
    try {
      var uri = Uri.parse(request.url);

      var router = GoRouter.of(config.navigatorKey.currentState!.context);
      if (uri.queryParameters['error'] != null) {
        router.pop();
      }
      
      var checkHost = uri.host == redirectUriHost;
      
      if (uri.queryParameters['code'] != null && checkHost) {
        code = uri.queryParameters['code'];
        router.pop();
      }
    } catch (_) {}
    return NavigationDecision.navigate;
  }

  Future<void> clearCookies() async {
    await WebViewCookieManager().clearCookies();
  }

  String _constructUrlParams() =>
      _mapToQueryParams(authorizationRequest.parameters);

  String _mapToQueryParams(Map<String, String> params) {
    final queryParams = <String>[];
    params.forEach((String key, String value) =>
        queryParams.add('$key=${Uri.encodeQueryComponent(value)}'));
    return queryParams.join('&');
  }
}