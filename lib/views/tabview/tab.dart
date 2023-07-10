//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:restaurant/controller/tabBar.dart';
import '../../models/rest.dart';

class TabBarfff extends StatelessWidget {
  TabBarfff({super.key, required this.category});

  final List<Restaurant> category;
  final List<Tab> _tabs = <Tab>[];
  List<Tab> getTabs() {
    _tabs.clear();
    for (int i = 0; i < category.length; i++) {
      _tabs.add(getTab(i));
    }
    return _tabs;
  }

  Tab getTab(int w) {
    //log(category[w].tableMenuList.length.toString());
    return Tab(
      text: "${category[w].tableMenuList[w].menuCategory}",
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, value, child) {
        return DefaultTabController(
          length: category.length,
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: badges.Badge(
                      child: Text("0"),
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.grey[600],
                  ),
                ],
                leading: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                bottom: TabBar(
                unselectedLabelColor: Colors.grey[600],
                isScrollable: true,
                labelColor: Colors.red,
                indicatorColor: Colors.red,
                labelStyle: const TextStyle(fontSize: 16),
                    tabs: getTabs()
                            )
                            ),
            body: TabBarView(
                children: List.generate(category.length, (ind) => Text("ss"))),
          ),
        );
      },
    );
  }
}
