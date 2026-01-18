import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../shared/data/models/movie_response.dart';

part 'movies_datasource.g.dart';

@injectable
@RestApi()
abstract class MoviesDatasource {
  @factoryMethod
  factory MoviesDatasource(Dio dio) = _MoviesDatasource;

  @GET('/movie/popular')
  Future<MovieResponse> getPopularMovies();

  @GET('/movie/top_rated')
  Future<MovieResponse> getTopRatedMovies();

  @GET('/movie/upcoming')
  Future<MovieResponse> getUpcomingMovies({
    @Query("region") String region = 'BR',
  });

  @GET('/trending/movie/{time_window}')
  Future<MovieResponse> getTrendingMovies({
    @Path('time_window') String timeWindow = 'day',
  });
}
