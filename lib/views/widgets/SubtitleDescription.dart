import 'package:flutter/material.dart';

import '../../models/rest.dart';

class SubtitleDescription extends StatelessWidget {
  const SubtitleDescription({
    super.key,
    required this.data,
  });

  final CategoryDish data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 270,
      child: Text(
        data.dishDescription!,
        style: TextStyle(color: Colors.grey[700]),
      ),
    );
  }
}
