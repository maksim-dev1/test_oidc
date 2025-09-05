import 'dart:async';

import 'package:oidc/oidc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_oidc/auth_status.dart';
import 'package:test_oidc/oidc_auth/domain/repositories/oidc_auth_repository.dart';
import 'package:test_oidc/services/oidc_auth_service.dart';

class OidcAuthRepositoryImpl implements OidcAuthRepository {
  final OidcAuthService _oidcAuthService;


  @override
  OidcAuthRepositoryImpl({required OidcAuthService oidcAuthService})
    : _oidcAuthService = oidcAuthService;

  @override
  Future<AuthStatus> checkAuth() async {
    final authStatus = _oidcAuthService.authStatus;
    return authStatus;
  }

  @override
  Future<String?> getAccessToken() async {
    return _oidcAuthService.manager.currentUser?.token.accessToken;
  }

  @override
  Future<OidcUser?> login() async {
    final user = await _oidcAuthService.manager.loginAuthorizationCodeFlow();
    return user;
  }

  @override
  Future<OidcUser?> getUserInfo() async {
    final userInfo = _oidcAuthService.manager.currentUser;

    return userInfo;
  }

  @override
  Future<void> logout() async {
    await _oidcAuthService.manager.logout();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
