import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:news_application/models/article.dart';

class NewsApiProvider {
  final Client client = Client();
  final String _apiKey = 'd21b654241a14be090cd32210c8e91f9';

  Future<List<Article>> fetchLatestNews(int pageIndex) async {
    final Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?page=$pageIndex&pageSize=20&category=science&language=en&apiKey=$_apiKey");

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