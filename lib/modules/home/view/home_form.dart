import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/constants/palette.dart';
import 'package:news_application/widgets/carousel_article_tile.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../bloc/bloc.dart';
import '../../../widgets/list_article_tile.dart';
import '../../../models/article.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.appBackgroundLight,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('News'),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitialState) {
              context.read<HomeBloc>().add(GetArticlesEvent());
            } else if (state is NewsLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (state is HomeSuccessState) {
              return buildSuccessState(state.articles, context);
            } else if (state is HomeErrorState) {
              return buildErrorState(context);
            }
            return const Center(child: Text('Something Else Happened!'));
          },
        ),
      ),
    );
  }

  Widget buildSuccessState(List<Article> articles, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HomeBloc>(context).add(GetArticlesEvent());
      },
      child: Column(
        children: [
          buildCarousel(articles),
          const Padding(padding: EdgeInsets.only(top: 0),),
          Expanded(child: buildArticles(articles)),
        ],
      ),
    );
  }

  Widget buildErrorState(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HomeBloc>(context).add(GetArticlesEvent());
      },
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline),
            Text("Connection Error! Please try again."),
          ],
        ),
      ),
    );
  }

  Widget buildCarousel(List<Article> articles) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeFactor: 0,
      ),
      itemCount: articles.length,
      itemBuilder: (context, index, realIndex) {
        DateTime parsedDate = DateTime.parse(articles[index].publishedAt);
        String timeAgo = timeago.format(parsedDate, locale: 'en_short');

        return CarouselArticleTile(article: articles[index]);
      },
    );
  }

  Widget buildArticles(List<Article> articles) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.black.withOpacity(0.5),
        ),
        child: ListView.separated(
          itemCount: articles.length,
          itemBuilder: ((context, index) {
            DateTime parsedDate = DateTime.parse(articles[index].publishedAt);
            String timeAgo = timeago.format(parsedDate, locale: 'en_short');

            return ListArticleTile(article: articles[index]);
          }),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 2,
              color: Colors.grey,
            );
          },
        ),
      ),
    );
  }
}
