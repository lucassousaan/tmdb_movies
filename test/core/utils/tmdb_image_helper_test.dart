import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_movies/core/utils/tmdb_image_helper.dart';

void main() {
  group('TmdbImageHelper Tests', () {
    test(
      'Deve retornar a URL completa concatenada com a URL base corretamente',
      () {
        const path = '/poster.jpg';
        const expectedUrl = 'https://image.tmdb.org/t/p/w500/poster.jpg';

        final result = TmdbImageHelper.getPosterUrl(path);

        expect(result, expectedUrl);
      },
    );
  });
}
