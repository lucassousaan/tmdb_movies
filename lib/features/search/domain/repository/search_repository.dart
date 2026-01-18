import 'package:fpdart/fpdart.dart';

import '../../../../core/failures/failure.dart';
import '../../../../shared/domain/entities/movie.dart';

abstract class ISearchRepository {
  /// Busca filmes por uma string de consulta.
  /// Retorna um [Either] que pode conter:
  /// - Um [Failure] em caso de erro.
  /// - Uma lista de [Movie] em caso de sucesso.
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
}
