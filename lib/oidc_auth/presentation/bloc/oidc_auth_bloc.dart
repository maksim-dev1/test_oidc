import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_oidc/auth_status.dart';
import 'package:test_oidc/oidc_auth/domain/repositories/oidc_auth_repository.dart';

part 'oidc_auth_event.dart';
part 'oidc_auth_state.dart';
part 'oidc_auth_bloc.freezed.dart';

class OidcAuthBloc extends Bloc<OidcAuthEvent, OidcAuthState> {
  final OidcAuthRepository _oidcAuthRepository;
  OidcAuthBloc({required OidcAuthRepository oidcAuthRepository})
    : _oidcAuthRepository = oidcAuthRepository,
      super(const _Initial()) {
    on<OidcAuthEvent>(
      (event, emit) => switch (event) {
        _CheckAuth() => _checkAuth(emit: emit),
        _StartedAuth() => _startAuth(emit: emit),
        _Logout() => _logout(emit: emit),
      },
    );
  }

  Future<void> _startAuth({required Emitter<OidcAuthState> emit}) async {
    try {
      emit(const OidcAuthState.oidcAuthLoading());
      final user = await _oidcAuthRepository.login();
      if (user != null) {
        emit(const OidcAuthState.oidcAuthenticated());
      } else {
        emit(const OidcAuthState.oidcUnauthenticated());
      }
    } catch (e) {
      emit(const OidcAuthState.oidcUnauthenticated());
      rethrow;
    }
  }

  Future<void> _logout({required Emitter<OidcAuthState> emit}) async {
    try {
      emit(const OidcAuthState.oidcAuthLoading());
      await _oidcAuthRepository.logout();
      emit(const OidcAuthState.oidcUnauthenticated());
    } catch (e) {
      emit(const OidcAuthState.oidcUnauthenticated());
      rethrow;
    }
  }

  Future<void> _checkAuth({required Emitter<OidcAuthState> emit}) async {
    final authStatus = await _oidcAuthRepository.checkAuth();

    if (authStatus == AuthStatus.authenticated) {
      emit(const OidcAuthState.oidcAuthenticated());
    } else {
      emit(const OidcAuthState.oidcUnauthenticated());
    }
  }
}
