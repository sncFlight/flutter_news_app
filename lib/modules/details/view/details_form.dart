import 'package:flutter/material.dart';
import 'package:news_application/constants/palette.dart';
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
    return Scaffold(
      backgroundColor: Palette.appBackgroundLight,
      appBar: AppBar(
        actions: const [
          Icon(Icons.share),
        ],
        automaticallyImplyLeading: true,
        title: SizedBox(child: Text(article.title)),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImage(imageUrl: article.imageUrl),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400),
                ),
                Divider(
                  color: Colors.black,
                ),
                Text(
                  article.description,
                  maxLines: 50,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Text(
                  article.content,
                  maxLines: 50,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Text(
                  article.publishedAt,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const Text('Go To The Source'),
          ],
        ),
      )
    );
  }
}
