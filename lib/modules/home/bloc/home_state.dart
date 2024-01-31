import 'package:equatable/equatable.dart';

import 'package:news_application/models/article.dart';
import 'package:news_application/models/article_with_read_status.dart';

enum HomeStatus {
  initial,
  newsLoaded,
  moveToDetailsPage,
  loadingMoreLatestNews,
  failure,
}

final class HomeState extends Equatable {
  final HomeStatus status;
  final List<ArticleWithStatus> latestNews;
  final List<Article> featuredNews;
  final bool allNewsRead;
  final bool hasReachedMax;
  final int pageIndex;

  const HomeState({
    this.status = HomeStatus.initial,
    this.latestNews = const [],
    this.featuredNews = const [],
    this.allNewsRead = false,
    this.hasReachedMax = false,
    this.pageIndex = 1,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ArticleWithStatus>? latestNews,
    List<Article>? featuredNews,
    bool? allNewsRead,
    bool? hasReachedMax,
    int? pageIndex,
  }) {
    return HomeState(
      status: status ?? this.status,
      latestNews: latestNews ?? this.latestNews,
      featuredNews: featuredNews ?? this.featuredNews,
      allNewsRead: allNewsRead ?? this.allNewsRead,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object> get props => [
    status,
    latestNews,
    featuredNews,
    allNewsRead,
    hasReachedMax,
    pageIndex,
  ];
}