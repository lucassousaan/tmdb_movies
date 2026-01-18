import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/domain/entities/movie.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.success(List<Movie> movies) = _Success;
  const factory SearchState.empty() = _Empty;
  const factory SearchState.error(String message) = _Error;
}
