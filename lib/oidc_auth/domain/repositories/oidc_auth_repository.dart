import 'package:oidc/oidc.dart';
import 'package:test_oidc/auth_status.dart';

abstract interface class OidcAuthRepository {
  Future<AuthStatus> checkAuth();

  Future<OidcUser?> login();

  Future<String?> getAccessToken();

  Future<OidcUser?> getUserInfo();

  Future<void> logout();
}
