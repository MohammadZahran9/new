//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:restaurant/controller/addToCart.dart';
import '../../models/rest.dart';

class TabBarfff extends StatelessWidget {
  TabBarfff({super.key, required this.category});
  final List<Restaurant> category;
  final List<Color> colors = [Colors.green, Colors.red];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: category[0].tableMenuList.length,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Consumer<Cart>(builder: (context, v, child) {
                      return badges.Badge(
                        badgeContent: Text(v.count.toString()),
                        child: GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushNamed("Checkout"),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.grey[600],
                            )),
                      );
                    }),
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
                              title: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: badges.Badge(
                                        position: badges.BadgePosition.center(),
                                        badgeStyle: badges.BadgeStyle(
                                            badgeColor:
                                                colors[k % colors.length]),
                                        child: const Icon(Icons
                                            .check_box_outline_blank_sharp)),
                                  ),
                                  SizedBox(
                                    height: 44,
                                    width: 270,
                                    child: Text(
                                        category[0]
                                            .tableMenuList[ind]
                                            .categoryDishes[k]
                                            .dishName!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                children: [
                                  const Padding(padding: EdgeInsets.all(1)),
                                  SizedBox(
                                    width: 250,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 60),
                                          child: Text(
                                            "SAR ${category[0].tableMenuList[ind].categoryDishes[k].dishPrice} ",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Text(
                                              "${category[0].tableMenuList[ind].categoryDishes[k].dishCalories} calories",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.all(4)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 270,
                                              child: Text(
                                                category[0]
                                                    .tableMenuList[ind]
                                                    .categoryDishes[k]
                                                    .dishDescription!,
                                                style: TextStyle(
                                                    color: Colors.grey[700]),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(3)),
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
                              // trailing: CachedNetworkImage(
                              //   imageUrl: category[0]
                              //       .tableMenuList[ind]
                              //       .categoryDishes[k]
                              //       .dishImage,
                              //   fit: BoxFit.fill,
                              //   progressIndicatorBuilder:
                              //       (context, url, progress) =>
                              //           const CircularProgressIndicator(),
                              //   errorWidget: (context, url, error) =>
                              //       const Icon(Icons.error),
                              // ),
                            )));
                  });
            }))));
  }
}
