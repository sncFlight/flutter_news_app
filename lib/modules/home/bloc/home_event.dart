import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class PageOpenedEvent extends HomeEvent {}

class UpdateDataFetchedEvent extends HomeEvent {}

class MarkAllReadClickedEvent extends HomeEvent {}

class LoadMoreFetchedEvent extends HomeEvent {}

class ArticleClickedEvent extends HomeEvent {}
