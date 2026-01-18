import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const double width = 140;
    const double borderRadius = 12.0;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Shimmer.fromColors(
        baseColor: colorScheme.surfaceContainerHighest,
        highlightColor: colorScheme.surfaceContainer,
        child: Column(
          children: [
            Container(
              width: width,
              height: 200,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: width,
              height: 14,
              color: colorScheme.surfaceContainerHighest,
            ),
            const SizedBox(height: 4),
            Container(
              width: width * 0.7,
              height: 14,
              color: colorScheme.surfaceContainerHighest,
            ),
          ],
        ),
      ),
    );
  }
}
