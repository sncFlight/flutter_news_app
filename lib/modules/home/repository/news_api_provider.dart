import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:news_application/models/article.dart';
import 'package:uuid/uuid.dart';

class NewsApiProvider {
  Client client = Client();

  String cntry = 'us';

  final _apiKey = '53ea041b1e1c4c659b41767532da63f2';

  // Chech shared preference, push requset to newsapi.org server and parse to model
  Future<List<Article>> fetchNewsList() async {

    Uri url =
        Uri.parse("https://newsapi.org/v2/top-headlines?country=ru&apiKey=$_apiKey");

    final response = await client.get(url);
    if (response.statusCode == 200) {
      List<Article> articles = [];
      
      json.decode(response.body)['articles'].forEach((v) {
        articles.add(Article.fromJson(v));
      });

      return articles;
    } else {
      throw Exception("Faild to post!");
    }
  }
}