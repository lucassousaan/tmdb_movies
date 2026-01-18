import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_movies/core/failures/failure.dart';
import 'package:tmdb_movies/core/network/safe_api_call_mixin.dart';

class TestRepository with SafeApiCallMixin {
  Future<Either<Failure, T>> testCall<T>(Future<T> Function() call) {
    return safeCall(call);
  }
}

void main() {
  late TestRepository repository;

  setUp(() {
    repository = TestRepository();
  });

  group('SafeApiCallMixin Tests', () {
    test(
      'Deve retornar Right com o resultado quando a chamada for sucesso',
      () async {
        const resultData = 42;

        final result = await repository.testCall(() async => resultData);

        expect(result.isRight(), true);
        expect(result, const Right(resultData));
      },
    );

    test(
      'Deve retornar Left(ConnectionFailure) quando ocorrer um erro de conexão',
      () async {
        final dioError = DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.connectionTimeout,
        );

        final result = await repository.testCall(() async => throw dioError);

        expect(result.isLeft(), true);
        expect(result, isA<Left<Failure, dynamic>>());
        result.fold(
          (failure) => expect(failure, isA<ConnectionFailure>()),
          (_) => fail('Era esperado um ConnectionFailure'),
        );
      },
    );

    test(
      'Deve retornar Left(ServerFailure) quando ocorrer um erro de conexão',
      () async {
        final dioError = DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.badResponse,
          error: 'Erro interno no servidor',
          message: '500 Internal Server Error',
        );

        final result = await repository.testCall(() async => throw dioError);

        expect(result.isLeft(), true);
        expect(result, isA<Left<Failure, dynamic>>());
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Era esperado um ServerFailure'),
        );
      },
    );

    test('Deve retornar Left(UnknownFailure) para erros genéricos', () async {
      final exception = Exception('Erro desconhecido');

      final result = await repository.testCall(() async => throw exception);

      expect(result, isA<Left<Failure, dynamic>>());
      result.fold((failure) {
        expect(failure, isA<UnknownFailure>());
        expect(failure.message.contains('Erro desconhecido'), true);
      }, (_) => fail('Deveria ter retornado um erro'));
    });
  });
}
