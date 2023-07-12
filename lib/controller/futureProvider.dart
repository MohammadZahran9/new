import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/rest.dart';

class TabProvider extends ChangeNotifier{

  Future<List<Restaurant>> getdata(http.Client client) async {
  final response = await http
      .get(Uri.parse("https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad"));
  if (response.statusCode == 200) {
    final List<Restaurant> list = restaurantFromJson(response.body);
    return list;
  }
  notifyListeners();
  throw "error";
}
}