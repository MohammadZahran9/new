import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controller/addToCart.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, e, child) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text("Total: ${e.total}",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
      backgroundColor: Colors.green,
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
          itemCount:e.hh.length ,
          itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(e.hh[index].categoryDishes[index].dishName.toString()),
              subtitle: Text(e.hh[index].categoryDishes[index].dishPrice.toString()),
              trailing: GestureDetector(
                onTap: () => e.remove(e.cart[index], index),
                child: Icon(Icons.remove),
              ),
            ),
          );
        },),
      )
    );
    },);
  }
}