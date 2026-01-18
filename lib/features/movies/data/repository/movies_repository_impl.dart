import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/network/safe_api_call_mixin.dart';
import '../../../../shared/domain/entities/movie.dart';
import '../../domain/repository/movies_repository.dart';
import '../datasource/movies_datasource.dart';

@LazySingleton(as: IMoviesRepository)
class MoviesRepositoryImpl with SafeApiCallMixin implements IMoviesRepository {
  final MoviesDatasource _datasource;

  MoviesRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() {
    return safeCall(() async {
      final response = await _datasource.getPopularMovies();
      return response.results.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() {
    return safeCall(() async {
      final response = await _datasource.getTopRatedMovies();
      return response.results.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() {
    return safeCall(() async {
      final response = await _datasource.getTrendingMovies();
      return response.results.map((e) => e.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() {
    return safeCall(() async {
      final response = await _datasource.getUpcomingMovies();
      return response.results.map((e) => e.toEntity()).toList();
    });
  }
}
