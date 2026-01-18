import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tmdb_movies/core/failures/failure.dart';
import 'package:tmdb_movies/features/search/domain/usecases/search_movies.dart';
import 'package:tmdb_movies/features/search/presentation/bloc/search_bloc.dart';
import 'package:tmdb_movies/features/search/presentation/bloc/search_event.dart';
import 'package:tmdb_movies/features/search/presentation/bloc/search_state.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';

class MockSearchMovies extends Mock implements SearchMovies {}

class FakeSearchMoviesParams extends Fake implements SearchMoviesParams {}

void main() {
  late SearchBloc bloc;
  late MockSearchMovies mockSearchMovies;

  setUpAll(() {
    registerFallbackValue(FakeSearchMoviesParams());
  });

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    bloc = SearchBloc(mockSearchMovies);
  });

  tearDown(() {
    bloc.close();
  });

  group('SearchBloc Tests', () {
    const testQuery = 'Dune';
    final testDate = DateTime(2014, 11, 7);
    const testParams = SearchMoviesParams(query: testQuery);

    final testMovies = [
      Movie(
        id: 1,
        title: 'Dune',
        overview: 'Muita areia...',
        posterPath: '/dune.jpg',
        voteAverage: 9.0,
        releaseDate: testDate,
        backdropPath: '',
      ),
    ];

    test('O estado inicial deve ser SearchState.initial', () {
      expect(bloc.state, const SearchState.initial());
    });

    blocTest<SearchBloc, SearchState>(
      'Deve emitir [Loading, Success] quando a busca retornar sucesso',
      build: () {
        when(
          () => mockSearchMovies(any()),
        ).thenAnswer((_) async => Right(testMovies));
        return bloc;
      },
      act: (bloc) => bloc.add(const SearchEvent.queryChanged(testQuery)),
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const SearchState.loading(),
        SearchState.success(testMovies),
      ],
      verify: (_) {
        verify(() => mockSearchMovies(testParams)).called(1);
      },
    );

    blocTest<SearchBloc, SearchState>(
      'Deve emitir [Loading, Empty] quando a busca retornar vazia',
      build: () {
        when(
          () => mockSearchMovies(any()),
        ).thenAnswer((_) async => const Right([]));
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const SearchEvent.queryChanged('seilaseilaseila')),
      wait: const Duration(milliseconds: 300),
      expect: () => [const SearchState.loading(), const SearchState.empty()],
    );

    blocTest<SearchBloc, SearchState>(
      'Deve emitir [Loading, Error] quando a busca falhar',
      build: () {
        when(
          () => mockSearchMovies(any()),
        ).thenAnswer((_) async => const Left(ServerFailure('Erro na API')));
        return bloc;
      },
      act: (bloc) => bloc.add(const SearchEvent.queryChanged(testQuery)),
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const SearchState.loading(),
        const SearchState.error('Erro na API'),
      ],
    );

    blocTest<SearchBloc, SearchState>(
      'Deve emitir [Initial] quando a query for vazia',
      build: () => bloc,
      act: (bloc) => bloc.add(const SearchEvent.queryChanged('')),
      wait: const Duration(milliseconds: 300),
      expect: () => [const SearchState.initial()],
      verify: (_) {
        verifyNever(() => mockSearchMovies(any()));
      },
    );

    blocTest<SearchBloc, SearchState>(
      'Deve ignorar a digitação rapida (debounce) e chamar o UseCase apenas uma vez',
      build: () {
        when(
          () => mockSearchMovies(any()),
        ).thenAnswer((_) async => Right(testMovies));
        return bloc;
      },
      act: (bloc) async {
        bloc.add(const SearchEvent.queryChanged('D'));
        bloc.add(const SearchEvent.queryChanged('Du'));
        bloc.add(const SearchEvent.queryChanged('Dun'));
        bloc.add(const SearchEvent.queryChanged('Dune'));
      },
      wait: const Duration(milliseconds: 600),
      expect: () => [
        const SearchState.loading(),
        SearchState.success(testMovies),
      ],
      verify: (_) {
        verify(
          () => mockSearchMovies(const SearchMoviesParams(query: 'Dune')),
        ).called(1);
      },
    );
  });
}
