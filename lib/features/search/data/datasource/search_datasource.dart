import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../shared/data/models/movie_response.dart';

part 'search_datasource.g.dart';

@injectable
@RestApi()
abstract class SearchDatasource {
  @factoryMethod
  factory SearchDatasource(Dio dio) = _SearchDatasource;

  @GET('/search/movie')
  Future<MovieResponse> searchMovies({
    @Query("query") required String query,
    @Query("page") int page = 1,
  });
}
