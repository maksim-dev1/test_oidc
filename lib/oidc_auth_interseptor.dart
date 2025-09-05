import 'package:dio/dio.dart';
import 'package:test_oidc/oidc_auth/domain/repositories/oidc_auth_repository.dart';

class OidcAuthInterceptor implements InterceptorsWrapper {
  /// Репозиторий аутентификации.
  final OidcAuthRepository _oidcAuthRepository;

  /// Создает экземпляр [OidcAuthRepository].
  ///
  /// Параметры:
  /// * [oidcAuthRepository] - Экземпляр [OidcAuthRepository], используемый
  ///   для выполнения операций аутентификации (обязательное поле).
  OidcAuthInterceptor({required OidcAuthRepository oidcAuthRepository}) : _oidcAuthRepository = oidcAuthRepository;

  @override
  Future<void> onError(DioException error, ErrorInterceptorHandler handler) async {
    // Проверяем, что код ошибки 401
    if (error.response != null && error.response!.statusCode == 401) {
       await _oidcAuthRepository.logout();
    }

    // В остальных случаях передаём ошибку дальше
    return handler.next(error);
  }

  /// Обрабатывает исходящие запросы.
  ///
  /// Передает запрос следующему обработчику без изменений.
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handler.next(options);

  /// Обрабатывает входящие ответы.
  ///
  /// Передает ответ следующему обработчику без изменений.
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) =>
      handler.next(response);
}
