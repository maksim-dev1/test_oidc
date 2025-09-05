part of 'oidc_auth_bloc.dart';

@freezed
sealed class OidcAuthState with _$OidcAuthState {
  const factory OidcAuthState.initial() = _Initial;
  const factory OidcAuthState.oidcAuthLoading() = OidcAuthLoading;
  const factory OidcAuthState.oidcAuthenticated() = OidcAuthenticated;
  const factory OidcAuthState.oidcUnauthenticated() = OidcUnauthenticated;
}
