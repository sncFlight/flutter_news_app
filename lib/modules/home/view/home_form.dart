import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_application/constants/palette.dart';
import 'package:news_application/constants/text_styles.dart';
import 'package:news_application/models/article.dart';
import 'package:news_application/models/article_with_read_status.dart';
import 'package:news_application/modules/details/view/details_page.dart';
import 'package:news_application/modules/home/bloc/bloc.dart';
import 'package:news_application/widgets/carousel_article_tile.dart';
import 'package:news_application/widgets/home_shimmer.dart';
import 'package:news_application/widgets/list_article_tile.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  CarouselController? _carouselController;
  int carouselImagePosition = 0;

  @override
  void initState() {
    _carouselController = CarouselController();

    super.initState();
  }

  @override
  Widget build(_) {
    return Scaffold(
      backgroundColor: Palette.appBackground,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => BlocProvider.of<HomeBloc>(context).add(MarkAllReadClickedEvent()),
                  child: Icon(
                    Icons.done_all,
                    color: (state.allNewsRead) 
                      ? Colors.grey
                      : Colors.blueAccent,
                  ),
                );
              }
            )
          ),
        ],
        title: Text(
          'Science News',
          style: TextStyles.title(),
        ),
        backgroundColor: Palette.appBarBackground,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.status == HomeStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to retrieve data'),
                ),
              );
            }
          },
          builder: (context, state) {
            return (state.status == HomeStatus.initial)
              ? _buildShimmer()
              : _buildBodyWidget(
                  context: context,
                  featuredNews: state.featuredNews,
                  latestNews: state.latestNews,
                  state: state,
                );
          }
        ),
      )
    );
  }

  Widget _buildShimmer() {
    return const HomeShimmer();
  }

  Widget _buildBodyWidget({
    required List<ArticleWithStatus> latestNews,
    required List<Article> featuredNews,
    required BuildContext context,
    required HomeState state,
 }) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HomeBloc>(context).add(UpdateDataFetchedEvent());
      },
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && state.status == HomeStatus.newsLoaded) {
            BlocProvider.of<HomeBloc>(context).add(LoadMoreFetchedEvent());
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (featuredNews.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: _buildCarousel(featuredNews),
                ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              if (latestNews.isNotEmpty)
                _buildList(
                  latestNews: latestNews,
                  state: state,
                ),
              const Padding(padding: EdgeInsets.only(bottom: 15)),
              if (state.status == HomeStatus.loadingMoreLatestNews)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _buildLoadingMoreWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(List<Article> featuredNews) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Latest News',
            style: TextStyles.mainHeader(),
          ),
        ),
        Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() {
                    carouselImagePosition = index;
                  });
                },
              ),
              itemCount: featuredNews.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return CarouselArticleTile(article: featuredNews[index]);
              },
            ),
            DotsIndicator(
              dotsCount: featuredNews.length,
              position: carouselImagePosition,
              onTap: (position) {
                _carouselController?.animateToPage(position);
              },
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: Colors.blue,
                size: const Size.square(12.0),
                activeSize: const Size(24.0, 12.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildList({
    required List<ArticleWithStatus> latestNews,
    required HomeState state,
  }) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latest news',
                style: TextStyles.mainHeader(),
              ),
              const Padding(padding: EdgeInsets.only(top: 0)),
              ListView.separated(
                itemCount: latestNews.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(article: latestNews[index].article))),
                    child: ListArticleWithStatusTile(articleWithStatus: latestNews[index]),
                  );
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return const Padding(padding: EdgeInsets.only(top: 18));
                },
              ),
            ],
          ),
        );
      }
    );
  }
  
  Widget _buildLoadingMoreWidget() {
    return const CircularProgressIndicator();
  }
}
