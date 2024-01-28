import 'package:flutter/material.dart';
import 'package:news_application/constants/text_styles.dart';
import 'package:news_application/models/article.dart';
import 'package:news_application/widgets/custom_Image.dart';

class CarouselArticleTile extends StatelessWidget {
  final Article article;

  const CarouselArticleTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: CustomImage(imageUrl: article.imageUrl),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                article.title,
                style: TextStyles.description(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
