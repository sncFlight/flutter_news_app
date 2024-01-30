import 'package:news_application/models/article.dart';

class ArticleWithStatus {
  final Article article;
  bool isRead;

  ArticleWithStatus({
    required this.article,
    this.isRead = false,
  });
}
