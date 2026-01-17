import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiKey = dotenv.env['TMDB_API_KEY'];

    if (apiKey == null) {
      final error = DioException(
        requestOptions: options,
        error: 'API_KEY não encontrada no arquivo .env',
      );

      return handler.reject(error);
    }

    options.queryParameters['api_key'] = apiKey;
    options.queryParameters['language'] = 'pt-BR';

    return handler.next(options);
  }
}
