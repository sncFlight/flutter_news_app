import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

import 'package:news_application/models/article.dart';

class NewsApiProvider {
  final Client client = Client();
  final String _apiKey = 'ec5c45b1a9c14d61ba862c4fe832d43d';

  Future<List<Article>> fetchLatestNews(int pageIndex) async {
    final Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?page=$pageIndex&pageSize=20&category=science&language=en&apiKey=$_apiKey");

    try {
      final response = await client.get(url);
      List<Article> news = [];
      
      json.decode(response.body)['articles'].forEach((v) {
        news.add(Article.fromJson(v));
      });

      return news;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Article>> fetchFeaturedNews() async {
    const String featureTopic = 'space';
    final Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?q=$featureTopic&pageSize=5&language=en&apiKey=$_apiKey");

    try {
      final response = await client.get(url);
      List<Article> articles = [];
      
      json.decode(response.body)['articles'].forEach((v) {
        articles.add(Article.fromJson(v));
      });
      return articles;
    } catch (e) {
      rethrow;
    }
  }
}