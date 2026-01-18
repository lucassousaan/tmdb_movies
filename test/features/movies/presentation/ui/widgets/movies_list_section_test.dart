import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:tmdb_movies/features/movies/presentation/cubit/movies_state.dart';
import 'package:tmdb_movies/features/movies/presentation/ui/widgets/movie_card_shimmer.dart';
import 'package:tmdb_movies/features/movies/presentation/ui/widgets/movies_list_section.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';
import 'package:tmdb_movies/shared/widgets/movie_card.dart';

void main() {
  Widget makeTestableWidget({
    required MovieSection section,
    VoidCallback? onRetry,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: MoviesListSection(
          title: 'Sessão Teste',
          section: section,
          onRetry: onRetry ?? () {},
        ),
      ),
    );
  }

  group('MovieListSection Widget Tests', () {
    testWidgets('Deve exibir o Título corretamente', (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(section: const MovieSection.loading()),
      );

      expect(find.text('Sessão Teste'), findsOneWidget);
    });

    testWidgets('Deve exibir Shimmer quando o estado for Loading', (
      tester,
    ) async {
      await tester.pumpWidget(
        makeTestableWidget(section: const MovieSection.loading()),
      );

      expect(find.byType(MovieCardShimmer), findsWidgets);
    });

    testWidgets(
      'Deve exibir Mensagem de Erro e Botão de Tentar novamente quando falhar',
      (tester) async {
        bool retryCalled = false;

        await tester.pumpWidget(
          makeTestableWidget(
            section: const MovieSection.error('Falha na internet'),
            onRetry: () => retryCalled = true,
          ),
        );

        expect(find.text('Falha na internet'), findsOneWidget);

        expect(find.byIcon(Icons.refresh), findsOneWidget);

        final retryTextFinder = find.text('Tentar novamente');
        expect(retryTextFinder, findsOneWidget);

        await tester.tap(retryTextFinder);
        expect(retryCalled, true);
      },
    );

    testWidgets(
      'Deve exibir Mensagem de Vazio quando a lista for sucesso mas vazia',
      (tester) async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            makeTestableWidget(section: const MovieSection.success([])),
          );
        });

        expect(find.text('Nenhum filme encontrado'), findsOneWidget);
      },
    );

    testWidgets('Deve exibir Lista de MovieCards quando houver filmes', (
      tester,
    ) async {
      final tMovies = [
        Movie(
          id: 1,
          title: 'Dune',
          overview: 'Muita areia...',
          posterPath: '/dune1.jpg',
          voteAverage: 8.0,
          releaseDate: DateTime(2021, 10, 22),
          backdropPath: '',
        ),
        Movie(
          id: 2,
          title: 'Dune 2',
          overview: 'Mais areia ainda...',
          posterPath: '/dune2.jpg',
          voteAverage: 8.5,
          releaseDate: DateTime(2024, 3, 1),
          backdropPath: '',
        ),
      ];

      await mockNetworkImages(() async {
        await tester.pumpWidget(
          makeTestableWidget(section: MovieSection.success(tMovies)),
        );
      });

      expect(find.byType(MovieCard), findsNWidgets(2));
      expect(find.text('Dune'), findsOneWidget);
      expect(find.text('Dune 2'), findsOneWidget);
    });
  });
}
