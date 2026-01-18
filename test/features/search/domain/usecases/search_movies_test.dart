import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_movies/core/failures/failure.dart';
import 'package:tmdb_movies/features/search/domain/repository/search_repository.dart';
import 'package:tmdb_movies/features/search/domain/usecases/search_movies.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';

class MockSearchRepository extends Mock implements ISearchRepository {}

void main() {
  late SearchMovies useCase;
  late MockSearchRepository mockSearchRepository;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    useCase = SearchMovies(mockSearchRepository);
  });

  group('SearchMovies UseCase Tests', () {
    const testQuery = 'Interstellar';
    final testDate = DateTime(2014, 11, 7);
    const testParams = SearchMoviesParams(query: testQuery);

    final testMovies = [
      Movie(
        id: 1,
        title: 'Interstellar',
        overview: 'Cooper descobre um buraco de minhoca...',
        posterPath: '/interstellar.jpg',
        voteAverage: 9.0,
        releaseDate: testDate,
        backdropPath: '',
      ),
    ];

    const testFailure = ServerFailure('Erro ao buscar filmes');

    test('Deve chamar o repositorio com a query e retornar sucesso', () async {
      when(
        () => mockSearchRepository.searchMovies(testQuery),
      ).thenAnswer((_) async => Right(testMovies));

      final result = await useCase(testParams);

      expect(result, Right(testMovies));

      verify(() => mockSearchRepository.searchMovies(testQuery)).called(1);
      verifyNoMoreInteractions(mockSearchRepository);
    });

    test('Deve retornar Failure se o repositorio falhar', () async {
      when(
        () => mockSearchRepository.searchMovies(any()),
      ).thenAnswer((_) async => Left(testFailure));

      final result = await useCase(testParams);

      expect(result, Left(testFailure));

      verify(() => mockSearchRepository.searchMovies(testQuery)).called(1);
      verifyNoMoreInteractions(mockSearchRepository);
    });
  });
}
