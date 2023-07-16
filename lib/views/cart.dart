import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controller/addToCart.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, e, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              elevation: 0.0,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Total Price: ${e.total}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            backgroundColor: Colors.green,
            body: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: e.hh.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("${e.hh[index].dishName}"),
                        subtitle: Text("Price : SAR ${e.hh[index].dishPrice}"),
                        trailing: GestureDetector(
                          onTap: () => e.remove(e.cart[index]),
                          child: const Icon(Icons.remove),
                        ),
                      ),
                    );
                  },
                )));
      },
    );
  }
}
