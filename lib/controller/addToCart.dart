import 'package:flutter/material.dart';

import '../models/rest.dart';

class Cart extends ChangeNotifier{
  int g = 0 ;
  double _count = 0;
  List<TableMenuList> hh = [];

  void add(TableMenuList i,int r) {
    hh.add(i);
    g++;
    _count += i.categoryDishes[r].dishPrice;
    notifyListeners();
  }

  void remove(TableMenuList i,int r) {
    hh.remove(i);
    _count -= i.categoryDishes[r].dishPrice;
    notifyListeners();
  }
  int get count {
    return hh.length;
  }

  double get total {
    return _count;
  }

  List<TableMenuList> get cart {
    return hh;
  }
}