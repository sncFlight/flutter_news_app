import 'package:flutter/material.dart';
import 'package:news_application/constants/palette.dart';
import 'package:news_application/constants/text_styles.dart';
import 'package:news_application/models/article.dart';
import 'package:news_application/widgets/custom_image.dart';

class DetailsForm extends StatelessWidget{
  final Article article;

  const DetailsForm({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String formattedPublishedAt = article.publishedAt.replaceAll(RegExp('[TZ]'), ' ');

    return Scaffold(
      backgroundColor: Palette.appBackground,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(article.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                child: CustomImage(
                  imageUrl: article.imageUrl,
                ),
              ),
              Text(
                article.title,
                style: TextStyles.mainHeader(),
              ),
              Text(
                formattedPublishedAt,
                style: TextStyles.notation(),
              ),
              Text(
                article.content * 1,
                style: TextStyles.common(),
              )
            ],
          ),
        ),
      )
    );
  }
}
