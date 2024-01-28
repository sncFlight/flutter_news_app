class Article {
  String author;
  String title;
  String description;
  String publishedAt;
  String content;
  String imageUrl;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.content,
    required this.imageUrl,
  });

  Article.fromJson(Map json) :
    author = json['author'] ?? '',
    title = json['title'] ?? '',
    description = json['description'] ?? '',
    imageUrl = json['urlToImage'] ?? '',
    content = json['content'] ?? '',
    publishedAt = json['publishedAt'] ?? '';
}
