import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    required String posterPath,
    required String backdropPath,
    required double voteAverage,
    required DateTime? releaseDate,
  }) = _Movie;
}
