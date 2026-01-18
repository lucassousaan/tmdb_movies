import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb_movies/features/movies/presentation/ui/pages/movie_details_page.dart';

import '../../features/search/presentation/ui/pages/search_page.dart';
import '../../shared/domain/entities/movie.dart';
import '../../features/movies/presentation/ui/pages/movies_page.dart';

abstract class AppRoutes {
  static const String movies = '/';
  static const String details = '/details';
  static const String search = '/search';
}

@module
abstract class RouterModule {
  @singleton
  GoRouter get router => GoRouter(
    initialLocation: AppRoutes.movies,
    routes: [
      GoRoute(
        path: AppRoutes.movies,
        name: 'MoviesScreen',
        builder: (context, state) {
          return const MoviesPage();
        },
      ),
      GoRoute(
        path: AppRoutes.details,
        name: 'details',
        builder: (context, state) {
          final movie = state.extra as Movie;
          return MovieDetailsPage(movie: movie);
        },
      ),
      GoRoute(
        path: AppRoutes.search,
        name: 'search',
        builder: (context, state) {
          return const SearchPage();
        },
      ),
    ],
  );
}
