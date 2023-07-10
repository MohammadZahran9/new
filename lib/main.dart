import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/views/home.dart';

import 'controller/tabBar.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> TabProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),);
  }
}