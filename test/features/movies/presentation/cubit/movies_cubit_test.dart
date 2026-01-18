import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_movies/core/failures/failure.dart';
import 'package:tmdb_movies/core/usecase/usecase.dart';
import 'package:tmdb_movies/features/movies/domain/usecases/get_popular_movies.dart';
import 'package:tmdb_movies/features/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:tmdb_movies/features/movies/domain/usecases/get_trending_movies.dart';
import 'package:tmdb_movies/features/movies/domain/usecases/get_upcoming_movies.dart';
import 'package:tmdb_movies/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:tmdb_movies/features/movies/presentation/cubit/movies_state.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';

class MockGetPopularMovies extends Mock implements GetPopularMovies {}

class MockGetTopRatedMovies extends Mock implements GetTopRatedMovies {}

class MockGetTrendingMovies extends Mock implements GetTrendingMovies {}

class MockGetUpcomingMovies extends Mock implements GetUpcomingMovies {}

void main() {
  late MoviesCubit cubit;
  late MockGetPopularMovies mockGetPopularMovies;
  late MockGetTopRatedMovies mockGetTopRatedMovies;
  late MockGetTrendingMovies mockGetTrendingMovies;
  late MockGetUpcomingMovies mockGetUpcomingMovies;

  setUpAll(() {
    registerFallbackValue(NoParams());
  });

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    mockGetTrendingMovies = MockGetTrendingMovies();
    mockGetUpcomingMovies = MockGetUpcomingMovies();
    cubit = MoviesCubit(
      mockGetPopularMovies,
      mockGetTopRatedMovies,
      mockGetTrendingMovies,
      mockGetUpcomingMovies,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('MoviesCubit Tests', () {
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

    test('O estado inicial deve ser MoviesState()', () {
      expect(cubit.state, const MoviesState());
    });

    blocTest<MoviesCubit, MoviesState>(
      'Deve emitir [Loading, Success] no estado Popular quando fetchPopularMovies funcionar',
      build: () {
        when(
          () => mockGetPopularMovies(any()),
        ).thenAnswer((_) async => Right(testMovies));
        return cubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      expect: () => [
        cubit.state.copyWith(popular: const MovieSection.loading()),
        cubit.state.copyWith(popular: MovieSection.success(testMovies)),
      ],
      verify: (_) {
        verify(() => mockGetPopularMovies(any())).called(1);
      },
    );

    blocTest<MoviesCubit, MoviesState>(
      'Deve emitir [Loading, Error] no estado Popular quando fetchPopularMovies falhar',
      build: () {
        when(
          () => mockGetPopularMovies(any()),
        ).thenAnswer((_) async => const Left(ServerFailure('Erro na API')));
        return cubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      expect: () => [
        cubit.state.copyWith(popular: const MovieSection.loading()),
        cubit.state.copyWith(popular: const MovieSection.error('Erro na API')),
      ],
    );

    blocTest<MoviesCubit, MoviesState>(
      'Deve emitir [Loading, Success] no estado TopRated quando fetchTopRatedMovies funcionar',
      build: () {
        when(
          () => mockGetTopRatedMovies(any()),
        ).thenAnswer((_) async => Right(testMovies));
        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => [
        cubit.state.copyWith(topRated: const MovieSection.loading()),
        cubit.state.copyWith(topRated: MovieSection.success(testMovies)),
      ],
      verify: (_) {
        verify(() => mockGetTopRatedMovies(any())).called(1);
      },
    );

    blocTest<MoviesCubit, MoviesState>(
      'Deve emitir [Loading, Error] no estado TopRated quando fetchTopRatedMovies falhar',
      build: () {
        when(
          () => mockGetTopRatedMovies(any()),
        ).thenAnswer((_) async => const Left(ServerFailure('Erro na API')));
        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => [
        cubit.state.copyWith(topRated: const MovieSection.loading()),
        cubit.state.copyWith(topRated: const MovieSection.error('Erro na API')),
      ],
    );

    blocTest<MoviesCubit, MoviesState>(
      'Deve emitir [Loading, Success] no estado Trending quando fetchTrendingMovies funcionar',
      build: () {
        when(
          () => mockGetTrendingMovies(any()),
        ).thenAnswer((_) async => Right(testMovies));
        return cubit;
      },
      act: (cubit) => cubit.fetchTrendingMovies(),
      expect: () => [
        cubit.state.copyWith(trending: const MovieSection.loading()),
        cubit.state.copyWith(trending: MovieSection.success(testMovies)),
      ],
      verify: (_) {
        verify(() => mockGetTrendingMovies(any())).called(1);
      },
    );

    blocTest<MoviesCubit, MoviesState>(
      'Deve emitir [Loading, Error] no estado Trending quando fetchTrendingMovies falhar',
      build: () {
        when(
          () => mockGetTrendingMovies(any()),
        ).thenAnswer((_) async => const Left(ServerFailure('Erro na API')));
        return cubit;
      },
      act: (cubit) => cubit.fetchTrendingMovies(),
      expect: () => [
        cubit.state.copyWith(trending: const MovieSection.loading()),
        cubit.state.copyWith(trending: const MovieSection.error('Erro na API')),
      ],
    );

    blocTest<MoviesCubit, MoviesState>(
      'Deve emitir [Loading, Success] no estado Upcoming quando fetchUpcomingMovies funcionar',
      build: () {
        when(
          () => mockGetUpcomingMovies(any()),
        ).thenAnswer((_) async => Right(testMovies));
        return cubit;
      },
      act: (cubit) => cubit.fetchUpcomingMovies(),
      expect: () => [
        cubit.state.copyWith(upcoming: const MovieSection.loading()),
        cubit.state.copyWith(upcoming: MovieSection.success(testMovies)),
      ],
      verify: (_) {
        verify(() => mockGetUpcomingMovies(any())).called(1);
      },
    );

    blocTest<MoviesCubit, MoviesState>(
      'Deve emitir [Loading, Error] no estado Upcoming quando fetchUpcomingMovies falhar',
      build: () {
        when(
          () => mockGetUpcomingMovies(any()),
        ).thenAnswer((_) async => const Left(ServerFailure('Erro na API')));
        return cubit;
      },
      act: (cubit) => cubit.fetchUpcomingMovies(),
      expect: () => [
        cubit.state.copyWith(upcoming: const MovieSection.loading()),
        cubit.state.copyWith(upcoming: const MovieSection.error('Erro na API')),
      ],
    );
  });
}
