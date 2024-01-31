import 'package:flutter/material.dart';

import 'package:news_application/constants/text_styles.dart';
import 'package:news_application/models/article.dart';
import 'package:news_application/widgets/custom_Image.dart';

class CarouselArticleTile extends StatelessWidget {
  final Article article;

  const CarouselArticleTile({
    super.key, 
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          CustomImage(
            imageUrl: article.imageUrl,
            canShowPlaceholder: false,
            radius: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.carouselTextStyle(),
              ),
            ),
          ),
        ],
      )
    );
  }
}
