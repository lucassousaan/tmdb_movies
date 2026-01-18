import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/router_module.dart';
import '../../core/utils/tmdb_image_helper.dart';
import '../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 12.0;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.details, extra: movie);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: CachedNetworkImage(
                    imageUrl: TmdbImageHelper.getPosterUrl(movie.posterPath),
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: colorScheme.surfaceContainerHighest),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(borderRadius),
                        border: Border.all(color: colorScheme.outline),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.broken_image,
                          color: colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.inverseSurface.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onInverseSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 36,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                movie.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
