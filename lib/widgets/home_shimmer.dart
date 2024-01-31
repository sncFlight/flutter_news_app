import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:news_application/constants/palette.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Shimmer.fromColors(
              baseColor: Palette.shimmer,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Palette.shimmer,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Shimmer.fromColors(
              baseColor: Palette.shimmer,
              highlightColor: Colors.grey[100]!,
              child: ListView.separated(
                itemCount: 20,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildArticleShimmer();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(padding: EdgeInsets.only(top: 18));
                },
              ),
            ),
          ],
        ),
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
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
                  width:  double.infinity,
                  color: Palette.shimmer,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 16,
                  width: double.infinity,
                  color: Palette.shimmer,
                ),
                const SizedBox(height: 16),
                Container(
                  height: 16,
                  width: 75,
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
