import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:tmdb_movies/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:tmdb_movies/features/movies/presentation/cubit/movies_state.dart';
import 'package:tmdb_movies/features/movies/presentation/ui/pages/movies_page.dart';
import 'package:tmdb_movies/features/movies/presentation/ui/widgets/movies_list_section.dart';

class MockMoviesCubit extends MockCubit<MoviesState> implements MoviesCubit {}

void main() {
  late MockMoviesCubit mockMoviesCubit;

  setUp(() {
    mockMoviesCubit = MockMoviesCubit();

    GetIt.I.registerFactory<MoviesCubit>(() => mockMoviesCubit);

    when(() => mockMoviesCubit.loadAllSections()).thenReturn(null);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Widget makeTestableWidget() {
    return const MaterialApp(home: MoviesPage());
  }

  group('MoviesPage Widget Tests', () {
    testWidgets('Deve chamar loadAllSections ao inicializar a página', (
      tester,
    ) async {
      when(() => mockMoviesCubit.state).thenReturn(const MoviesState());

      await mockNetworkImages(() async {
        await tester.pumpWidget(makeTestableWidget());
      });

      verify(() => mockMoviesCubit.loadAllSections()).called(1);
    });

    testWidgets('Deve renderizar as 4 seções de filmes com os títulos corretos', (
      tester,
    ) async {
      /// Tive que colocar esse tamanho grande para evitar problemas com o ListView
      /// Como o ListView é lazy, se a tela for pequena, nem todas as seções são renderizadas e o teste falha
      tester.view.physicalSize = const Size(1080, 3000);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(tester.view.resetPhysicalSize);
      when(() => mockMoviesCubit.state).thenReturn(const MoviesState());

      await mockNetworkImages(() async {
        await tester.pumpWidget(makeTestableWidget());
      });

      expect(find.byType(MoviesListSection), findsNWidgets(4));

      expect(find.text('Populares'), findsOneWidget);
      expect(find.text('Melhores Avaliados'), findsOneWidget);
      expect(find.text('Em Alta'), findsOneWidget);
      expect(find.text('Em Breve'), findsOneWidget);
    });

    testWidgets(
      'Deve exibir o AppBar com o título TMDB Movies e botão de busca',
      (tester) async {
        when(() => mockMoviesCubit.state).thenReturn(const MoviesState());

        await mockNetworkImages(() async {
          await tester.pumpWidget(makeTestableWidget());
        });

        expect(find.text('TMDB Movies'), findsOneWidget);
        expect(find.byIcon(Icons.search), findsOneWidget);
      },
    );
  });
}
