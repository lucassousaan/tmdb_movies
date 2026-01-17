import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie.dart';
import '../repository/movies_repository.dart';

@injectable
class GetPopularMovies implements UseCase<List<Movie>, NoParams> {
  final IMoviesRepository repository;

  GetPopularMovies(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) {
    return repository.getPopularMovies();
  }
}
