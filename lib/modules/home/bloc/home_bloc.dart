import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';
import 'package:news_application/models/article.dart';
import 'package:news_application/modules/home/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetArticlesEvent) {
        emit(NewsLoadingState());
        try {
          final HomeRepository newsRepository = HomeRepository();
          List<Article> articles = await newsRepository.getArticles();
          emit(HomeSuccessState(articles));
        } catch (e) {
          emit(HomeErrorState());
          throw ("Couldn't fetch data! BLOC Error!");
        }
      } else if (event is ArticleClickedEvent) {
      }
    });
  }
}
