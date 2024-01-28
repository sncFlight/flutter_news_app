import 'package:equatable/equatable.dart';
import 'package:news_application/models/article.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeInitialState extends HomeState {}

class NewsLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class ArticleClickedState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Article> articles;
  HomeSuccessState(this.articles);
}
