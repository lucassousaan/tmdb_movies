import 'package:flutter/material.dart';

import '../../cubit/movies_state.dart';
import '../../../../../shared/widgets/movie_card.dart';
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
            loading: () => ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
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
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: movies.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 140,
                    child: MovieCard(movie: movies[index]),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
