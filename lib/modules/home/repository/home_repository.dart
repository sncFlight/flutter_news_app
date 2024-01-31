import 'package:news_application/models/article.dart';
import 'package:news_application/modules/home/repository/news_api_provider.dart';

abstract class Repository {
  Future<List<Article>> getLatestNews(int pageIndex);

  Future<List<Article>> getFeaturedNews();
}

class MockRepository extends Repository {
  final List<Article> testData = [
    Article(
      title: "Scientists Develop Breakthrough Treatment for Alzheimer's Disease",
      publishedAt: "2024-01-31T08:00:00Z",
      content: "In a groundbreaking study, scientists have developed a promising new treatment for Alzheimer's"
        + " disease that shows significant improvement in cognitive function among patients.",
      imageUrl: '',
    ),
    Article(
      title: "New Exoplanetary System Discovered with Earth-Like Conditions",
      publishedAt: "2024-01-30T12:30:00Z",
      content: "Astronomers have announced the discovery of a new exoplanetary"
        + " system, including a planet with conditions similar to Earth. This finding marks a crucial step in the"
        + " search for potentially habitable worlds beyond our solar system.",
      imageUrl: '',
    ),
    Article(
      title: "Breakthrough in Renewable Energy: Efficient Solar Cells with Record Conversion Rates",
      publishedAt: "2024-01-29T15:45:00Z",
      content: "Researchers have achieved a major breakthrough in renewable energy"
       + " with the development of highly efficient solar cells, boasting record-breaking conversion rates."
       + " This advancement holds promise for more sustainable and accessible solar power.",
      imageUrl: '',
    ),
    Article(
      title: "Revolutionary Robotics: AI-Powered Prosthetics Mimic Natural Limb Movements",
      publishedAt: "2024-01-27T14:00:00Z",
      content: "In a leap forward for robotics, researchers have developed AI-powered prosthetics"
        + "that mimic natural limb movements with unprecedented accuracy. This innovation holds great promise for improving the quality of life for amputees.",
      imageUrl: '',
    ),
    Article(
      title: "Gene Editing Technology Shows Promise in Curing Genetic Disorders",
      publishedAt: "2024-01-28T09:15:00Z",
      content: "Scientists are making strides in the field of gene editing, showcasing its potential in curing genetic disorders."
        + "Recent experiments have demonstrated successful corrections of faulty genes, opening new possibilities for treating hereditary diseases.",
      imageUrl: ''
    ),
  ];
  
  @override
  Future<List<Article>> getLatestNews(int pageIndex) async {
    return testData;
  }
  
  @override
  Future<List<Article>> getFeaturedNews() async {
    return testData;
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
