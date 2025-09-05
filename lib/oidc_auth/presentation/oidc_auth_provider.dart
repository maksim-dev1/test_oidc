import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_oidc/oidc_auth/data/repositories/oidc_auth_repository_impl.dart';
import 'package:test_oidc/oidc_auth/domain/repositories/oidc_auth_repository.dart';
import 'package:test_oidc/oidc_auth/presentation/bloc/oidc_auth_bloc.dart';
import 'package:test_oidc/oidc_auth_interseptor.dart';
import 'package:test_oidc/services/oidc_auth_service.dart';
import 'package:test_oidc/token_interceptor.dart';

// class OidcAuthProvider extends StatelessWidget {
//   final Widget child;
//   final OidcAuthService oidcAuthService;
//   const OidcAuthProvider({required this.child, required this.oidcAuthService, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider<OidcAuthRepository>(
//       create: (context) => OidcAuthRepositoryImpl(oidcAuthService: oidcAuthService),
//       child: BlocProvider(
//         lazy: false,
//         create: (context) {
//           context.read<Dio>().interceptors.addAll([
//             OidcAuthInterceptor(oidcAuthRepository: context.read<OidcAuthRepository>()),
//             TokenInterceptor(oidcAuthService: oidcAuthService),
//           ]);
//           return OidcAuthBloc(oidcAuthRepository: context.read<OidcAuthRepository>())
//             ..add(const OidcAuthEvent.checkAuth());
//         },
//         child: child,
//       ),
//     );
//   }
// }

class OidcAuthProvider extends StatelessWidget {
  final Widget child;
  final OidcAuthService oidcAuthService;
  const OidcAuthProvider({required this.child, required this.oidcAuthService, super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<OidcAuthRepository>(
      create: (_) => OidcAuthRepositoryImpl(oidcAuthService: oidcAuthService),
      child: RepositoryProvider<Dio>(
        create: (context) {
          final dio = Dio();
          dio.interceptors.addAll([
            OidcAuthInterceptor(oidcAuthRepository: context.read<OidcAuthRepository>()),
            TokenInterceptor(oidcAuthService: oidcAuthService),
          ]);
          return dio;
        },
        child: BlocProvider<OidcAuthBloc>(
          lazy: false,
          create: (context) => OidcAuthBloc(
            oidcAuthRepository: context.read<OidcAuthRepository>(),
          )..add(const OidcAuthEvent.checkAuth()),
          child: child,
        ),
      ),
    );
  }
}
