import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:tmdb_movies/features/movies/presentation/ui/pages/movie_details_page.dart';
import 'package:tmdb_movies/shared/domain/entities/movie.dart';

void main() {
  Widget makeTestableWidget(Movie movie) {
    return MaterialApp(home: MovieDetailsPage(movie: movie));
  }

  group('MovieDetailsPage Widget Tests', () {
    testWidgets(
      'Deve renderizar todos os dados corretamente quando o filme estiver com todas informações',
      (tester) async {
        final testDate = DateTime(2014, 11, 7);

        final testMovie = Movie(
          id: 1,
          title: 'Interstellar',
          overview: 'Cooper descobre um buraco de minhoca...',
          posterPath: '/interstellar.jpg',
          voteAverage: 9.0,
          releaseDate: testDate,
          backdropPath: '/backdrop.jpg',
        );

        await mockNetworkImages(() async {
          await tester.pumpWidget(makeTestableWidget(testMovie));
        });

        expect(find.text('Interstellar (2014)'), findsOneWidget);

        expect(find.byType(CachedNetworkImage), findsOneWidget);

        expect(find.text('9.0'), findsOneWidget);
        expect(find.byIcon(Icons.star), findsOneWidget);

        expect(
          find.text('Cooper descobre um buraco de minhoca...'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Deve renderizar Placeholders/Fallbacks quando o filme tiver dados faltando',
      (tester) async {
        const tMovieEmpty = Movie(
          id: 2,
          title: 'Um Filme que voce nunca verá',
          overview: '',
          posterPath: '/poster.jpg',
          backdropPath: '',
          voteAverage: 0.0,
          releaseDate: null,
        );

        await mockNetworkImages(() async {
          await tester.pumpWidget(makeTestableWidget(tMovieEmpty));
        });

        expect(find.text('Um Filme que voce nunca verá (N/A)'), findsOneWidget);

        expect(find.byType(CachedNetworkImage), findsNothing);

        expect(find.text('Sem avaliação'), findsOneWidget);

        expect(
          find.text('Nenhuma sinopse disponível para este filme.'),
          findsOneWidget,
        );
      },
    );
  });
}
