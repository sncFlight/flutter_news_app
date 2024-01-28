import 'package:news_application/models/article.dart';
import 'package:news_application/modules/home/repository/news_api_provider.dart';

class HomeRepository {
  Future<List<Article>> getArticles() async {
    NewsApiProvider newsApiProvider = NewsApiProvider();
    
    return await newsApiProvider.fetchNewsList();
  }
}
