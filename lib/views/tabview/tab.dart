import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controller/addToCart.dart';
import '../../models/rest.dart';
import '../widgets/AppbarActions.dart';
import '../widgets/PriceAndCal.dart';
import '../widgets/SubtitleDescription.dart';
import '../widgets/TitleName.dart';
import '../widgets/TrailingImage.dart';

class TabBarfff extends StatelessWidget {
  TabBarfff({super.key, required this.category});
  final List<Restaurant> category;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: category[0].tableMenuList.length,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  AppbarActions(),
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
                    tabs: List.generate(
                        category[0].tableMenuList.length,
                        (index) => Text(category[0]
                            .tableMenuList[index]
                            .menuCategory
                            .toString())))),
            body: TabBarView(
                children:
                    List.generate(category[0].tableMenuList.length, (ind) {
              return ListView.builder(
                  itemCount:
                      category[0].tableMenuList[ind].categoryDishes.length,
                  itemBuilder: (context, k) {
                    int quantity = 0;
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Card(
                            borderOnForeground: true,
                            child: ListTile(
                              title: TitleName(
                                  k: k,
                                  data: category[0]
                                      .tableMenuList[ind]
                                      .categoryDishes[k]),
                              subtitle: Column(
                                children: [
                                  const Padding(padding: EdgeInsets.all(1)),
                                  SizedBox(
                                    width: 250,
                                    child: PriceAndCal(
                                        data: category[0]
                                            .tableMenuList[ind]
                                            .categoryDishes[k]),
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SubtitleDescription(
                                          data: category[0]
                                              .tableMenuList[ind]
                                              .categoryDishes[k],
                                        ),
                                        Padding(padding: EdgeInsets.all(3)),
                                        Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Consumer<Cart>(
                                                  builder: (context, x, child) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 7, left: 9),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          x.remove(category[0]
                                                              .tableMenuList[
                                                                  ind]
                                                              .categoryDishes[k]);
                                                          if (quantity > 0) {
                                                            quantity--;
                                                          }
                                                        },
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                        quantity.toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          x.add(category[0]
                                                              .tableMenuList[
                                                                  ind]
                                                              .categoryDishes[k]);
                                                          quantity++;
                                                        },
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              trailing: TrailingImage(
                                  data: category[0]
                                      .tableMenuList[ind]
                                      .categoryDishes[k]),
                            )));
                  });
            }))));
  }
}
