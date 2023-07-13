import 'package:flutter/material.dart';

import '../../models/rest.dart';
import 'package:badges/badges.dart' as badges;

class TitleName extends StatelessWidget {
  TitleName({
    super.key,
    required this.data,
    required this.k,
  });

  final List<Color> colors = [Colors.green, Colors.red];
  final CategoryDish data;
  final int k;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: badges.Badge(
              position: badges.BadgePosition.center(),
              badgeStyle:
                  badges.BadgeStyle(badgeColor: colors[k % colors.length]),
              child: const Icon(Icons.check_box_outline_blank_sharp)),
        ),
        SizedBox(
          height: 44,
          width: 270,
          child: Text(data.dishName!,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}
