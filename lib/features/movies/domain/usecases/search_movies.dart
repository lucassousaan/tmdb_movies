import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repository/movies_repository.dart';

@injectable
class SearchMovies implements UseCase<List<Movie>, SearchMoviesParams> {
  final IMoviesRepository repository;
  SearchMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(SearchMoviesParams params) {
    return repository.searchMovies(params.query);
  }
}

class SearchMoviesParams extends Equatable {
  final String query;

  const SearchMoviesParams({required this.query});

  @override
  List<Object?> get props => [query];
}
