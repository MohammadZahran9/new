import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../../controller/addToCart.dart';

class AppbarActions extends StatelessWidget {
  const AppbarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Consumer<Cart>(builder: (context, v, child) {
        return badges.Badge(
          badgeContent: Text(v.count.toString()),
          child: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed("Checkout"),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.grey[600],
              )),
        );
      }),
    );
  }
}
