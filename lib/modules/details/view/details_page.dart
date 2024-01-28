import 'package:flutter/material.dart';
import 'package:news_application/models/article.dart';
import 'package:news_application/modules/details/view/details_form.dart';

class DetailsPage extends StatelessWidget {
  final Article article;
  const DetailsPage({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return DetailsForm(article: article);
  }
}
