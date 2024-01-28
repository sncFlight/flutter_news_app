import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  const CustomImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                : null,
            ),
          );
        }
      },
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/placeholder.png',
          )
        );
      },
    );
    // return FadeInImage(
    //   placeholder: Image.asset(
    //     alignment: Alignment.center,
    //     fit: BoxFit.scaleDown,
    //      'assets/images/placeholder.png'
    //   ).image,
    //   imageErrorBuilder: (context, error, stackTrace) {
    //     return Container(
    //       alignment: Alignment.center,
    //       child: Image.asset(
    //         'assets/images/placeholder.png',
    //       ),
    //     );
    //   },
    //   image: Image.network(
    //     imageUrl,
    //   ).image,
    // );
  }
}