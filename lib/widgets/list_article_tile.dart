import 'package:flutter/material.dart';

import 'package:news_application/constants/palette.dart';
import 'package:news_application/constants/text_styles.dart';
import 'package:news_application/helpers/functions.dart';
import 'package:news_application/models/article_with_read_status.dart';
import 'package:news_application/widgets/custom_Image.dart';

class ListArticleWithStatusTile extends StatelessWidget {
  final ArticleWithStatus articleWithStatus;

  const ListArticleWithStatusTile({
    super.key,
    required this.articleWithStatus,
  });

  @override
  Widget build(BuildContext context) {
    String timeAgo = formatElapsedTime(articleWithStatus.article.publishedAt);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: articleWithStatus.isRead
          ? Palette.articleReadTile
          : Palette.articleNotReadTile,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CustomImage(imageUrl: articleWithStatus.article.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      articleWithStatus.article.title,
                      style: TextStyles.common()
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      timeAgo,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
