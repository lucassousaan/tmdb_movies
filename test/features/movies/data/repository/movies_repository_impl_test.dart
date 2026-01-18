import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_movies/core/failures/failure.dart';
import 'package:tmdb_movies/features/movies/data/datasource/movies_datasource.dart';
import 'package:tmdb_movies/features/movies/data/repository/movies_repository_impl.dart';
import 'package:tmdb_movies/shared/data/models/movie_model.dart';
import 'package:tmdb_movies/shared/data/models/movie_response.dart';

class MockMoviesDatasource extends Mock implements MoviesDatasource {}

void main() {
  late MoviesRepositoryImpl repository;
  late MockMoviesDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockMoviesDatasource();
    repository = MoviesRepositoryImpl(mockDatasource);
  });

  group('MoviesRepositoryImpl', () {
    final testMovieModel = MovieModel(
      id: 1,
      title: 'Interstellar',
      overview: 'Cooper descobre um buraco de minhoca...',
      posterPath: '/interstellar.jpg',
      voteAverage: 9.0,
      releaseDate: '2014-11-07',
      backdropPath: '',
    );

    final testMovieResponse = MovieResponse(results: [testMovieModel]);

    test(
      'getPopularMovies deve chamar datasource e retornar lista de filmes',
      () async {
        when(
          () => mockDatasource.getPopularMovies(),
        ).thenAnswer((_) async => testMovieResponse);
        final result = await repository.getPopularMovies();

        expect(result.isRight(), true);
        verify(() => mockDatasource.getPopularMovies()).called(1);
      },
    );

    test(
      'getTopRatedMovies deve chamar datasource e retornar lista de filmes',
      () async {
        when(
          () => mockDatasource.getTopRatedMovies(),
        ).thenAnswer((_) async => testMovieResponse);
        final result = await repository.getTopRatedMovies();

        expect(result.isRight(), true);
        verify(() => mockDatasource.getTopRatedMovies()).called(1);
      },
    );

    test(
      'getTrendingMovies deve chamar datasource e retornar lista de filmes',
      () async {
        when(
          () => mockDatasource.getTrendingMovies(),
        ).thenAnswer((_) async => testMovieResponse);
        final result = await repository.getTrendingMovies();

        expect(result.isRight(), true);
        verify(() => mockDatasource.getTrendingMovies()).called(1);
      },
    );

    test(
      'getUpcomingMovies deve chamar datasource e retornar lista de filmes',
      () async {
        when(
          () => mockDatasource.getUpcomingMovies(),
        ).thenAnswer((_) async => testMovieResponse);

        final result = await repository.getUpcomingMovies();

        expect(result.isRight(), true);
        verify(() => mockDatasource.getUpcomingMovies()).called(1);
      },
    );

    test(
      'getPopularMovies deve retornar Left(Failure) quando der erro no datasource',
      () async {
        when(() => mockDatasource.getPopularMovies()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            type: DioExceptionType.badResponse,
          ),
        );

        final result = await repository.getPopularMovies();

        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Deveria ter falhado'),
        );
      },
    );
  });
}
