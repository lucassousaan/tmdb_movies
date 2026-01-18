import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:tmdb_movies/features/search/presentation/bloc/search_bloc.dart';
import 'package:tmdb_movies/features/search/presentation/bloc/search_event.dart';
import 'package:tmdb_movies/features/search/presentation/bloc/search_state.dart';
import 'package:tmdb_movies/features/search/presentation/ui/pages/search_page.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';

class MockSearchBloc extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

void main() {
  late MockSearchBloc mockSearchBloc;

  setUp(() {
    mockSearchBloc = MockSearchBloc();

    GetIt.I.registerFactory<SearchBloc>(() => mockSearchBloc);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget makeTestableWidget() {
    return const MaterialApp(home: SearchPage());
  }

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

  group('SearchPage Widget Tests', () {
    testWidgets('Deve mostrar estado inicial quando abrir', (tester) async {
      when(() => mockSearchBloc.state).thenReturn(const SearchState.initial());

      await tester.pumpWidget(makeTestableWidget());

      expect(find.text('Busque por seus filmes favoritos'), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('Deve mostrar loading quando estiver carregando', (
      tester,
    ) async {
      when(() => mockSearchBloc.state).thenReturn(const SearchState.loading());

      await tester.pumpWidget(makeTestableWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Deve mostrar mensagem de erro quando o estado for error', (
      tester,
    ) async {
      when(
        () => mockSearchBloc.state,
      ).thenReturn(const SearchState.error('Erro ao buscar filmes.'));

      await tester.pumpWidget(makeTestableWidget());

      expect(find.text('Erro ao buscar filmes.'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('Deve mostrar mensagem de vazio quando o estado for empty', (
      tester,
    ) async {
      when(() => mockSearchBloc.state).thenReturn(const SearchState.empty());

      await tester.pumpWidget(makeTestableWidget());

      expect(find.text('Nenhum filme encontrado.'), findsOneWidget);
      expect(find.byIcon(Icons.sentiment_dissatisfied_rounded), findsOneWidget);
    });

    testWidgets('Deve mostrar grid de filmes quando o estado for success', (
      tester,
    ) async {
      when(
        () => mockSearchBloc.state,
      ).thenReturn(SearchState.success(testMovies));

      await mockNetworkImages(() async {
        await tester.pumpWidget(makeTestableWidget());
      });

      expect(find.byType(GridView), findsOneWidget);
      expect(find.text('Interstellar'), findsOneWidget);
    });

    testWidgets('Deve adicionar evento quando digitar no TextField', (
      tester,
    ) async {
      when(() => mockSearchBloc.state).thenReturn(const SearchState.initial());
      await tester.pumpWidget(makeTestableWidget());

      await tester.enterText(find.byType(TextField), 'Dune');

      await tester.pump();

      verify(
        () => mockSearchBloc.add(const SearchEvent.queryChanged('Dune')),
      ).called(1);
    });

    testWidgets('Deve limpar o texto e disparar evento vazio ao clicar no X', (
      tester,
    ) async {
      when(() => mockSearchBloc.state).thenReturn(const SearchState.initial());
      await tester.pumpWidget(makeTestableWidget());

      await tester.enterText(find.byType(TextField), 'Texto');
      await tester.pump();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(find.text(''), findsOneWidget);
      verify(
        () => mockSearchBloc.add(const SearchEvent.queryChanged('')),
      ).called(1);
    });
  });
}
