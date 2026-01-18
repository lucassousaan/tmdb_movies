import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/network/safe_api_call_mixin.dart';
import '../../../../shared/domain/entities/movie.dart';
import '../../domain/repository/search_repository.dart';
import '../datasource/search_datasource.dart';

@LazySingleton(as: ISearchRepository)
class SearchRepositoryImpl with SafeApiCallMixin implements ISearchRepository {
  final SearchDatasource _datasource;

  SearchRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) {
    return safeCall(() async {
      final response = await _datasource.searchMovies(query: query);
      return response.results.map((e) => e.toEntity()).toList();
    });
  }
}
