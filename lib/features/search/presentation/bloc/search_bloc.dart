import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/usecases/search_movies.dart';
import 'search_event.dart';
import 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMovies _searchMovies;

  SearchBloc(this._searchMovies) : super(const SearchState.initial()) {
    on<SearchEvent>(
      _onEvent,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .distinct()
            .switchMap(mapper);
      },
    );
  }

  Future<void> _onEvent(SearchEvent event, Emitter<SearchState> emit) async {
    await event.when(
      queryChanged: (query) async {
        if (query.trim().isEmpty) {
          emit(const SearchState.initial());
          return;
        }

        emit(const SearchState.loading());

        final result = await _searchMovies(SearchMoviesParams(query: query));

        result.fold((failure) => emit(SearchState.error(failure.message)), (
          movies,
        ) {
          if (movies.isEmpty) {
            emit(const SearchState.empty());
          } else {
            emit(SearchState.success(movies));
          }
        });
      },
    );
  }
}
