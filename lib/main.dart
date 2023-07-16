import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controller/addToCart.dart';
import 'package:restaurant/views/cart.dart';
import 'package:restaurant/views/home.dart';

import 'controller/futureProvider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabProvider()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        routes: {
          "Checkout": (context) => const Checkout(),
        },
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
