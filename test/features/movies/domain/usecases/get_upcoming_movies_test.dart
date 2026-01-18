import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_movies/core/failures/failure.dart';
import 'package:tmdb_movies/core/usecase/usecase.dart';
import 'package:tmdb_movies/features/movies/domain/repository/movies_repository.dart';
import 'package:tmdb_movies/features/movies/domain/usecases/get_upcoming_movies.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';

class MockMoviesRepository extends Mock implements IMoviesRepository {}

void main() {
  late GetUpcomingMovies useCase;
  late MockMoviesRepository mockRepository;

  setUp(() {
    mockRepository = MockMoviesRepository();
    useCase = GetUpcomingMovies(mockRepository);
  });

  group('GetUpcomingMovies UseCase', () {
    final testDate = DateTime(2014, 11, 7);

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

    test(
      'Deve chamar getUpcomingMovies no repositório e retornar a lista',
      () async {
        when(
          () => mockRepository.getUpcomingMovies(),
        ).thenAnswer((_) async => Right(testMovies));

        final result = await useCase(NoParams());

        expect(result, Right(testMovies));
        verify(() => mockRepository.getUpcomingMovies()).called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('Deve retornar Failure se o repositorio falhar', () async {
      when(
        () => mockRepository.getUpcomingMovies(),
      ).thenAnswer((_) async => Left(testFailure));

      final result = await useCase(NoParams());

      expect(result, Left(testFailure));

      verify(() => mockRepository.getUpcomingMovies()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
