import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controller/tabBar.dart';
import 'package:restaurant/views/tabview/tab.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.getdata(http.Client()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
             if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return TabBarfff(category: snapshot.data,);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
          },
        );
      },
    );
  }
}





