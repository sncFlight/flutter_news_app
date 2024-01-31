class Article {
  String title;
  String publishedAt;
  String content;
  String imageUrl;

  Article({
    required this.title,
    required this.publishedAt,
    required this.content,
    required this.imageUrl,
  });

  Article.fromJson(Map json) :
    title = json['title'] ?? '',
    imageUrl = json['urlToImage'] ?? '',
    content = json['content'] ?? '',
    publishedAt = json['publishedAt'] ?? '';
}
