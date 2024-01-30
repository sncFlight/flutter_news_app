import 'package:news_application/models/article.dart';
import 'package:news_application/modules/home/repository/news_api_provider.dart';

abstract class Repository {
  Future<List<Article>> getLatestNews(int pageIndex);

  Future<List<Article>> getFeaturedNews();
}

class MockRepository extends Repository {
  @override
  Future<List<Article>> getLatestNews(int pageIndex) async {
    return [];
  }
  
  @override
  Future<List<Article>> getFeaturedNews() async {
    return [];
  }

}
class RealRepository extends Repository {
  NewsApiProvider newsApiProvider = NewsApiProvider();

  @override
  Future<List<Article>> getLatestNews(int pageIndex) async {    
    return await newsApiProvider.fetchLatestNews(pageIndex);
  }

  @override
  Future<List<Article>> getFeaturedNews() async {
    return await newsApiProvider.fetchFeaturedNews();
  }
}
