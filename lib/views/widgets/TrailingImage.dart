import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/rest.dart';

class TrailingImage extends StatelessWidget {
  const TrailingImage({
    super.key,
    required this.data,
  });

  final CategoryDish data;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: data.dishImage,
      fit: BoxFit.fill,
      progressIndicatorBuilder: (context, url, progress) =>
          const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
