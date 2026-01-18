import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/movie.dart';

part 'movie_model.g.dart';
part 'movie_model.freezed.dart';

@freezed
abstract class MovieModel with _$MovieModel {
  const MovieModel._();

  const factory MovieModel({
    required int id,
    String? title,
    String? overview,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Movie toEntity() {
    return Movie(
      id: id,
      title: title ?? 'Sem título',
      overview: overview ?? '',
      posterPath: posterPath ?? '',
      backdropPath: backdropPath ?? '',
      voteAverage: voteAverage ?? 0.0,
      releaseDate: releaseDate != null ? DateTime.tryParse(releaseDate!) : null,
    );
  }
}
