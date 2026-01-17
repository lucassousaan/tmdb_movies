import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const double width = 140;
    const double borderRadius = 12.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            Container(
              width: width,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            const SizedBox(height: 8),
            Container(width: width, height: 14, color: Colors.white),
            const SizedBox(height: 4),
            Container(width: width * 0.7, height: 14, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
