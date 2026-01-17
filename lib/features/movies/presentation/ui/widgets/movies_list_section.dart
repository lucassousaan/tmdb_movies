import 'package:flutter/material.dart';

import '../../cubit/movies_state.dart';
import 'movie_card.dart';
import 'movie_card_shimmer.dart';

class MoviesListSection extends StatelessWidget {
  final String title;
  final MovieSection section;
  final VoidCallback onRetry;

  const MoviesListSection({
    super.key,
    required this.title,
    required this.section,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 280;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(
          height: height,
          child: section.when(
            loading: () => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: 5,
              itemBuilder: (context, index) => const MovieCardShimmer(),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: colorScheme.error),
                  ),
                  const SizedBox(height: 8),
                  FilledButton.tonalIcon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Tentar novamente'),
                  ),
                ],
              ),
            ),
            success: (movies) {
              if (movies.isEmpty) {
                return Center(
                  child: Text(
                    "Nenhum filme encontrado",
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                );
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: movies[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
