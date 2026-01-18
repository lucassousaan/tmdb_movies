import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../shared/domain/entities/movie.dart';
import '../../../../../shared/widgets/movie_card.dart';
import '../../bloc/search_bloc.dart';
import '../../bloc/search_event.dart';
import '../../bloc/search_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => __SearchViewState();
}

class __SearchViewState extends State<_SearchView> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onClearTapped(BuildContext context) {
    _searchController.clear();
    context.read<SearchBloc>().add(const SearchEvent.queryChanged(''));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: TextStyle(color: colorScheme.onSurface),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Digite o nome do filme...',
            hintStyle: TextStyle(
              color: colorScheme.onSurface.withValues(alpha: .6),
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.close, color: colorScheme.onSurface),
              onPressed: () => _onClearTapped(context),
            ),
          ),
          onChanged: (value) =>
              context.read<SearchBloc>().add(SearchEvent.queryChanged(value)),
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildMessage(
              context,
              icon: Icons.search,
              message: 'Busque por seus filmes favoritos',
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (movies) => _buildResults(movies),
            empty: () => _buildMessage(
              context,
              icon: Icons.sentiment_dissatisfied_rounded,
              message: 'Nenhum filme encontrado.',
            ),
            error: (message) => _buildMessage(
              context,
              icon: Icons.error_outline,
              message: message,
              isError: true,
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessage(
    BuildContext context, {
    required IconData icon,
    required String message,
    bool isError = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = isError ? colorScheme.error : colorScheme.onSurface;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: color.withValues(alpha: 0.5)),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(color: color, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildResults(List<Movie> movies) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(movie: movie);
      },
    );
  }
}
