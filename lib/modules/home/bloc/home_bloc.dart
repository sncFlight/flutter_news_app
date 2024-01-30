import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/models/article_with_read_status.dart';

import 'home_event.dart';
import 'home_state.dart';
import 'package:news_application/models/article.dart';
import 'package:news_application/modules/home/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  RealRepository? homeRepository;

  HomeBloc() : super(const HomeState()) {
    homeRepository = RealRepository();

    on<PageOpenedEvent>(_onPageOpened);
    on<MarkAllReadClickedEvent>(_onMarkAllReadClicked);
    on<ArticleClickedEvent>(_onArticleClicked);
    on<LoadMoreFetchedEvent>(_onLoadMoreFetched);
    on<UpdateDataFetchedEvent>(_onAllNewsFetched);
  }

  Future<void> _onPageOpened(
    PageOpenedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.initial,
      ),
    );

    await fetchAllNews(emit);
  }

  Future<void> _onMarkAllReadClicked(
    MarkAllReadClickedEvent event,
    Emitter<HomeState> emit,
  ) async {
    for (ArticleWithStatus articleWithReadStatus in state.latestNews) {
      articleWithReadStatus.isRead = true;
    }

    emit(
      state.copyWith(
        status: HomeStatus.newsLoaded,
        allNewsRead: true,
        latestNews: state.latestNews
      ),
    );
  }

  Future<void> _onArticleClicked(
    ArticleClickedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.moveToDetailsPage,
      ),
    );
  }

  Future<void> _onLoadMoreFetched(
    LoadMoreFetchedEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) {
      return;
    }

    emit(
      state.copyWith(
        status: HomeStatus.loadingMoreLatestNews,
      ),
    );
    final List<ArticleWithStatus> latestNews = state.latestNews;
    bool hasReachedMax = state.hasReachedMax;
    bool allNewsRead = state.allNewsRead;
    
    try {
      final List<Article> news = (await homeRepository?.getLatestNews(state.pageIndex) ?? []);
      final List<ArticleWithStatus> newsWithStatus = [];
      
      for (Article article in news) {
        newsWithStatus.add(ArticleWithStatus(
          article: article,
        ));
      }

      allNewsRead = newsWithStatus.isEmpty
        ? allNewsRead
        : false;

      latestNews.addAll(newsWithStatus);
      hasReachedMax = news.isEmpty
        ? true
        : false;
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,   
        ),
      );
    }
    
    emit(
      state.copyWith(
        status: HomeStatus.newsLoaded,
        pageIndex: state.pageIndex + 1,
        latestNews: latestNews,
        hasReachedMax: hasReachedMax,
        allNewsRead: allNewsRead,
      ),
    );
  }

  Future<void> _onAllNewsFetched(
    UpdateDataFetchedEvent event,
    Emitter<HomeState> emit,
  ) async {
    await fetchAllNews(emit);
  }

  Future<void> fetchAllNews(Emitter<HomeState> emit) async {
    final List<ArticleWithStatus> latestNews = [];
    final List<Article> featuredNews = [];
    bool allNewsRead = state.allNewsRead;

    try {
      final List<Article> news = (await homeRepository?.getLatestNews(state.pageIndex) ?? []);
      final List<ArticleWithStatus> newsWithStatus = [];
      
      for (Article article in news) {
        newsWithStatus.add(ArticleWithStatus(
          article: article,
        ));
      }

      allNewsRead = newsWithStatus.isEmpty
        ? allNewsRead
        : false;

      latestNews.addAll(newsWithStatus);
      featuredNews.addAll(await homeRepository?.getFeaturedNews() ?? []);

    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
        ),
      );
    }
      
    emit(
      state.copyWith(
        status: HomeStatus.newsLoaded,
        latestNews: latestNews,
        pageIndex: 2,
        featuredNews: featuredNews,
        allNewsRead: allNewsRead,
        hasReachedMax: latestNews.isEmpty
          ? true
          : false,
      ),
    );
  }
}
