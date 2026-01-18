import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/domain/entities/movie.dart';

part 'movies_state.freezed.dart';

@freezed
class MovieSection with _$MovieSection {
  const factory MovieSection.loading() = _Loading;
  const factory MovieSection.success(List<Movie> movies) = _Success;
  const factory MovieSection.error(String message) = _Error;
}

@freezed
abstract class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default(MovieSection.loading()) MovieSection popular,
    @Default(MovieSection.loading()) MovieSection topRated,
    @Default(MovieSection.loading()) MovieSection trending,
    @Default(MovieSection.loading()) MovieSection upcoming,
  }) = _MoviesState;
}
