import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetArticlesEvent extends HomeEvent {}

class ArticleClickedEvent extends HomeEvent {}
