import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';
import 'package:tmdb_movies/shared/widgets/movie_card.dart';

void main() {
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

  Widget makeTestableWidget() {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 140,
            child: MovieCard(movie: testMovies.first),
          ),
        ),
      ),
    );
  }

  group('MovieCard Widget Tests', () {
    testWidgets(
      'Deve renderizar os dados do filme corretamente (Título e Nota)',
      (tester) async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(makeTestableWidget());
        });

        expect(find.text('Interstellar'), findsOneWidget);
        expect(find.text('9.0'), findsOneWidget);

        expect(find.byIcon(Icons.star), findsOneWidget);
      },
    );

    testWidgets('Deve conter o widget de imagem (CachedNetworkImage)', (
      tester,
    ) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(makeTestableWidget());
      });

      expect(find.byType(CachedNetworkImage), findsOneWidget);

      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('Deve possuir um GestureDetector para navegação', (
      tester,
    ) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(makeTestableWidget());
      });

      expect(find.byType(GestureDetector), findsOneWidget);
    });
  });
}
