import 'package:flutter/material.dart';
import 'package:news_application/constants/palette.dart';
import 'package:news_application/constants/text_styles.dart';
import 'package:news_application/helpers/functions.dart';
import 'package:news_application/models/article_with_read_status.dart';
import 'package:news_application/widgets/custom_Image.dart';

class ListArticleWithStatusTile extends StatelessWidget {
  final ArticleWithStatus articleWithStatus;

  const ListArticleWithStatusTile({
    Key? key,
    required this.articleWithStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String timeAgo = formatElapsedTime(articleWithStatus.article.publishedAt);

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                children: [
                  Text(
                    articleWithStatus.article.title,
                    style: TextStyles.common()
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      timeAgo,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
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
