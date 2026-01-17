import 'package:fpdart/fpdart.dart';
import '../../../../core/failures/failure.dart';
import '../entities/movie.dart';

abstract class IMoviesRepository {
  /// Busca a lista de filmes populares.
  /// Retorna um [Either] que pode conter:
  /// - Um [Failure] em caso de erro.
  /// - Uma lista de [Movie] em caso de sucesso.
  Future<Either<Failure, List<Movie>>> getPopularMovies();

  /// Busca a lista de filmes em alta.
  Future<Either<Failure, List<Movie>>> getTrendingMovies();

  /// Busca a lista de filmes mais bem avaliados.
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  /// Busca a lista de filmes que estão por lançar.
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();

  /// Busca filmes por uma string de consulta.
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
}
