import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repository/movies_repository.dart';

@injectable
class GetMovieDetails implements UseCase<Movie, MovieDetailsParams> {
  final IMoviesRepository repository;
  GetMovieDetails(this.repository);

  @override
  Future<Either<Failure, Movie>> call(MovieDetailsParams params) {
    return repository.getMovieDetails(params.movieId);
  }
}

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
