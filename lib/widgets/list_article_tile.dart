import 'package:flutter/material.dart';
import 'package:news_application/constants/text_styles.dart';
import 'package:news_application/models/article.dart';
import 'package:news_application/widgets/custom_Image.dart';

class ListArticleTile extends StatelessWidget {
  final Article article;

  const ListArticleTile({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomImage(imageUrl: article.imageUrl),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 20)),
          Expanded(
            child: Column(
              children: [
                Text(
                  article.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.description(color: Colors.white)
                ),
                const SizedBox(height: 8.0),
                Text(
                  article.publishedAt,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
