// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oidc_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OidcAuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OidcAuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthEvent()';
  }
}

/// @nodoc
class $OidcAuthEventCopyWith<$Res> {
  $OidcAuthEventCopyWith(OidcAuthEvent _, $Res Function(OidcAuthEvent) __);
}

/// @nodoc

class _CheckAuth implements OidcAuthEvent {
  const _CheckAuth();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CheckAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthEvent.checkAuth()';
  }
}

/// @nodoc

class _StartedAuth implements OidcAuthEvent {
  const _StartedAuth();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StartedAuth);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthEvent.startedAuth()';
  }
}

/// @nodoc

class _Logout implements OidcAuthEvent {
  const _Logout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthEvent.logout()';
  }
}

/// @nodoc
mixin _$OidcAuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OidcAuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthState()';
  }
}

/// @nodoc
class $OidcAuthStateCopyWith<$Res> {
  $OidcAuthStateCopyWith(OidcAuthState _, $Res Function(OidcAuthState) __);
}

/// @nodoc

class _Initial implements OidcAuthState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthState.initial()';
  }
}

/// @nodoc

class OidcAuthLoading implements OidcAuthState {
  const OidcAuthLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OidcAuthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthState.oidcAuthLoading()';
  }
}

/// @nodoc

class OidcAuthenticated implements OidcAuthState {
  const OidcAuthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OidcAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthState.oidcAuthenticated()';
  }
}

/// @nodoc

class OidcUnauthenticated implements OidcAuthState {
  const OidcUnauthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OidcUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OidcAuthState.oidcUnauthenticated()';
  }
}

// dart format on
