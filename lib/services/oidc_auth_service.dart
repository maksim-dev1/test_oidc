import 'dart:async';

import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';
// import 'package:oidc_web_core/oidc_web_core.dart';
import 'package:test_oidc/auth_status.dart';

class OidcAuthService {
  final _authUrl = const String.fromEnvironment('AUTH_API_URL');
  final _clientId = const String.fromEnvironment('CLIENT_ID');
  final _redirectUri = const String.fromEnvironment('AUTH_REDIRECT_URL');
  final _postLogoutRedirectUri = const String.fromEnvironment('POST_LOOUT_URL');
  final _scope = const String.fromEnvironment('SCOPE', defaultValue: '[]');

  late final OidcUserManager manager;
  // late final OidcUserManagerWeb managerWeb;

  OidcAuthService() {
    final discoveryDocumentUri = OidcUtils.getOpenIdConfigWellKnownUri(
      Uri.parse(_authUrl),
    );
    final clientCredentials = OidcClientAuthentication.none(
      clientId: _clientId,
    );

    final store = OidcDefaultStore();
    // final storeWeb = OidcWebStore();
    final scope =
        _scope
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();

    final settings = OidcUserManagerSettings(
      redirectUri: Uri.parse(_redirectUri),
      postLogoutRedirectUri: Uri.parse(_postLogoutRedirectUri),
      scope: scope,

      refreshBefore: (token) => const Duration(seconds: 30),
      options: const OidcPlatformSpecificOptions(
        android: OidcPlatformSpecificOptions_AppAuth_Android(
          allowInsecureConnections: true,
        ),
      ),
    );

    // if (kIsWeb) {
    //   managerWeb = OidcUserManagerWeb.lazy(
    //     discoveryDocumentUri: discoveryDocumentUri,
    //     clientCredentials: clientCredentials,
    //     store: storeWeb,
    //     settings: settings,
    //   );
    // } else {
    //   manager = OidcUserManager.lazy(
    //     discoveryDocumentUri: discoveryDocumentUri,
    //     clientCredentials: clientCredentials,
    //     store: store,
    //     settings: settings,
    //   );
    // }

     manager = OidcUserManager.lazy(
        discoveryDocumentUri: discoveryDocumentUri,
        clientCredentials: clientCredentials,
        store: store,
        settings: settings,
      );
  }

  Future<void> init() async {
    // if (kIsWeb) {
    //   await managerWeb.init();
    //   print('User managerWeb initialized !');
    // } else {
    //   await manager.init();
    //   print('User manager initialized !');
    // }

      await manager.init();

    // manager.userChanges().listen((event) => print('userChanges: $event'),);
  }

  AuthStatus get authStatus {
    return manager.currentUser != null
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }
}
