class TmdbImageHelper {
  TmdbImageHelper._();

  static const String _baseUrl = 'https://image.tmdb.org/t/p/w500';

  static String getPosterUrl(String path) {
    return '$_baseUrl$path';
  }
}
