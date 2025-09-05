part of 'oidc_auth_bloc.dart';

@freezed
sealed class OidcAuthEvent with _$OidcAuthEvent {
  const factory OidcAuthEvent.checkAuth() = _CheckAuth;
  const factory OidcAuthEvent.startedAuth() = _StartedAuth;
  const factory OidcAuthEvent.logout() = _Logout;
}
