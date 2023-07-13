import 'package:flutter/material.dart';

import '../../models/rest.dart';

class PriceAndCal extends StatelessWidget {
  const PriceAndCal({
    super.key,
    required this.data,
  });

  final CategoryDish data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Text(
            "SAR ${data.dishPrice} ",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text("${data.dishCalories} calories",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
