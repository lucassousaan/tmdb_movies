import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_movies/core/failures/failure.dart';
import 'package:tmdb_movies/features/search/data/datasource/search_datasource.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_movies/features/search/data/repository/search_repository_impl.dart';
import 'package:tmdb_movies/shared/data/models/movie_model.dart';
import 'package:tmdb_movies/shared/data/models/movie_response.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';

class MockSearchDatasource extends Mock implements SearchDatasource {}

void main() {
  late SearchRepositoryImpl repository;
  late MockSearchDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockSearchDatasource();
    repository = SearchRepositoryImpl(mockDatasource);
  });

  group('SearchRepositoryImpl Tests', () {
    const testQuery = 'Interstellar';

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
      'Deve retornar Right(List<Movie>) quando o datasource retornar sucesso',
      () async {
        when(
          () => mockDatasource.searchMovies(query: testQuery),
        ).thenAnswer((_) async => testMovieResponse);

        final result = await repository.searchMovies(testQuery);

        expect(result.isRight(), true);

        result.fold(
          (failure) => fail('Deveria ter retornado um Right, sucesso'),
          (movies) {
            expect(movies.length, 1);
            expect(movies, isA<List<Movie>>());
            expect(movies.first.title, 'Interstellar');
          },
        );
      },
    );

    test(
      'Deve retornar Left(ConnectionFailure) quando o datasource lançar erro de conexão',
      () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.connectionTimeout,
        );

        when(
          () => mockDatasource.searchMovies(query: testQuery),
        ).thenThrow(dioException);

        final result = await repository.searchMovies(testQuery);

        expect(result.isLeft(), true);

        result.fold(
          (failure) => expect(failure, isA<ConnectionFailure>()),
          (movies) => fail('Deveria ter retornado erro'),
        );
      },
    );

    test(
      'Deve retornar Left(ServerFailure) quando o datasource lançar erro de servidor',
      () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.badResponse,
        );

        when(
          () => mockDatasource.searchMovies(query: testQuery),
        ).thenThrow(dioException);

        final result = await repository.searchMovies(testQuery);

        expect(result.isLeft(), true);

        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (movies) => fail('Deveria ter retornado erro'),
        );
      },
    );

    test(
      'Deve retornar Left(UnknownFailure) quando o datasource lançar erro desconhecido',
      () async {
        final exception = Exception('Erro desconhecido');

        when(
          () => mockDatasource.searchMovies(query: testQuery),
        ).thenThrow(exception);

        final result = await repository.searchMovies(testQuery);

        expect(result.isLeft(), true);

        result.fold(
          (failure) => expect(failure, isA<UnknownFailure>()),
          (movies) => fail('Deveria ter retornado erro'),
        );
      },
    );
  });
}
