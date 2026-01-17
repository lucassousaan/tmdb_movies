import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_movies/core/failures/failure.dart';
import 'package:tmdb_movies/features/movies/domain/entities/movie.dart';

import '../../domain/repository/movies_repository.dart';
import '../datasource/movies_datasource.dart';

@LazySingleton(as: IMoviesRepository)
class MoviesRepositoryImpl implements IMoviesRepository {
  final MoviesDatasource _datasource;

  MoviesRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() {
    return _safeCall(() async {
      final response = await _datasource.getPopularMovies();
      return response.results.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() {
    return _safeCall(() async {
      final response = await _datasource.getTopRatedMovies();
      return response.results.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() {
    return _safeCall(() async {
      final response = await _datasource.getTrendingMovies();
      return response.results.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() {
    return _safeCall(() async {
      final response = await _datasource.getUpcomingMovies();
      return response.results.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) {
    return _safeCall(() async {
      final response = await _datasource.searchMovies(query: query);
      return response.results.map((e) => e.toEntity()).toList();
    });
  }

  /// Wrapper genérico para chamadas seguras à API
  /// Ele captura erros do Dio e os converte em [Failure]
  /// Retorna um [Either] com o resultado ou o erro
  Future<Either<Failure, T>> _safeCall<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(UnknownFailure("Erro desconhecido: $e"));
    }
  }

  /// Converte erros do Dio em [Failure] específicos
  Failure _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const ConnectionFailure('Falha de conexão');
      case DioExceptionType.badResponse:
        return const ServerFailure('Erro ao buscar dados no servidor');
      default:
        return ServerFailure(
          'Erro de comunicação com o servidor: ${e.message}',
        );
    }
  }
}
