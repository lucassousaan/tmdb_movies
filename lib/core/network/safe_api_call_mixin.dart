import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

mixin SafeApiCallMixin {
  Future<Either<Failure, T>> safeCall<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure("Erro desconhecido: $e"));
    }
  }

  Failure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const ConnectionFailure('Falha de conexão');
      case DioExceptionType.badResponse:
        final message =
            e.response?.data?['status_message'] ?? 'Erro no servidor';
        return ServerFailure(message);
      default:
        return ServerFailure('Erro de comunicação: ${e.message}');
    }
  }
}
