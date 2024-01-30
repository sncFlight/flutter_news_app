import 'package:flutter/material.dart';
import 'package:news_application/constants/palette.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Palette.shimmer,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200,
              width: double.infinity,
              color: Palette.shimmer,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Palette.shimmer,
              highlightColor: Colors.grey[100]!,
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return _buildArticleShimmer();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(padding: EdgeInsets.only(top: 18));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleShimmer() {
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Palette.shimmer,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: double.infinity,
                  color: Palette.shimmer,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  width: 150,
                  color: Palette.shimmer,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  width: 100,
                  color: Palette.shimmer,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
