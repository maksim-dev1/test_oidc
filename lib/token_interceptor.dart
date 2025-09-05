// import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_oidc/services/oidc_auth_service.dart';

/// Интерсептор для обработки токенов аутентификации.
///
/// Этот класс реализует [InterceptorsWrapper] и используется
/// для добавления токена аутентификации в заголовки исходящих
/// запросов. Также он обрабатывает ошибки и ответы без изменений.
class TokenInterceptor implements InterceptorsWrapper {
  final OidcAuthService _oidcAuthService;

  TokenInterceptor({required OidcAuthService oidcAuthService}) : _oidcAuthService = oidcAuthService;

  /// Обрабатывает ошибки, возникающие при выполнении запросов.
  ///
  /// Этот метод просто передает ошибку следующему обработчику
  /// без дополнительных действий.
  @override
  Future<void> onError(DioException error, ErrorInterceptorHandler handler) async {
    handler.next(error);
  }

  /// Обрабатывает исходящие запросы.
  ///
  /// Этот метод извлекает токен аутентификации из
  /// [SharedPreferences] и добавляет его в заголовки запроса.
  /// Если токен не найден, запрос продолжается без изменений.
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');

    /// Временный токен для регистрации
    // final tempToken = prefs.getString('tempToken');

    // if (tempToken != null) {
    //   options.headers['Authorization'] = tempToken;
    //   options.headers['X-Auth-Token'] = tempToken;
    // } else if (token != null) {
    //   options.headers['Authorization'] = token;
    //   options.headers['X-Auth-Token'] = token;
    // }

    final token = _oidcAuthService.manager.currentUser?.token.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['X-Auth-Token'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  /// Обрабатывает входящие ответы.
  ///
  /// Этот метод просто передает ответ следующему обработчику
  /// без дополнительных действий.
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
