import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../../domain/usecases/get_trending_movies.dart';
import '../../domain/usecases/get_upcoming_movies.dart';
import 'movies_state.dart';

@injectable
class MoviesCubit extends Cubit<MoviesState> {
  final GetPopularMovies _getPopularMovies;
  final GetTopRatedMovies _getTopRatedMovies;
  final GetTrendingMovies _getTrendingMovies;
  final GetUpcomingMovies _getUpcomingMovies;

  MoviesCubit(
    this._getPopularMovies,
    this._getTopRatedMovies,
    this._getTrendingMovies,
    this._getUpcomingMovies,
  ) : super(const MoviesState());

  void loadAllSections() {
    fetchPopularMovies();
    fetchTopRatedMovies();
    fetchTrendingMovies();
    fetchUpcomingMovies();
  }

  Future<void> fetchPopularMovies() async {
    emit(state.copyWith(popular: const MovieSection.loading()));
    final result = await _getPopularMovies(NoParams());
    result.fold(
      (failure) =>
          emit(state.copyWith(popular: MovieSection.error(failure.message))),
      (movies) => emit(state.copyWith(popular: MovieSection.success(movies))),
    );
  }

  Future<void> fetchTopRatedMovies() async {
    emit(state.copyWith(topRated: const MovieSection.loading()));
    final result = await _getTopRatedMovies(NoParams());
    result.fold(
      (failure) =>
          emit(state.copyWith(topRated: MovieSection.error(failure.message))),
      (movies) => emit(state.copyWith(topRated: MovieSection.success(movies))),
    );
  }

  Future<void> fetchTrendingMovies() async {
    emit(state.copyWith(trending: const MovieSection.loading()));
    final result = await _getTrendingMovies(NoParams());
    result.fold(
      (failure) =>
          emit(state.copyWith(trending: MovieSection.error(failure.message))),
      (movies) => emit(state.copyWith(trending: MovieSection.success(movies))),
    );
  }

  Future<void> fetchUpcomingMovies() async {
    emit(state.copyWith(upcoming: const MovieSection.loading()));
    final result = await _getUpcomingMovies(NoParams());
    result.fold(
      (failure) =>
          emit(state.copyWith(upcoming: MovieSection.error(failure.message))),
      (movies) => emit(state.copyWith(upcoming: MovieSection.success(movies))),
    );
  }
}
