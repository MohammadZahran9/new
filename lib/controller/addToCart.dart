import 'package:flutter/material.dart';

import '../models/rest.dart';

class Cart extends ChangeNotifier {
  double _count = 0;
  List<CategoryDish> hh = [];

  void add(CategoryDish i) {
    hh.add(i);
    _count += i.dishPrice;
    notifyListeners();
  }

  void remove(CategoryDish i) {
    hh.remove(i);
    if (_count > 0.0) {
      _count -= i.dishPrice;
    }

    notifyListeners();
  }

  int get count {
    return hh.length;
  }

  double get total {
    return _count;
  }

  List<CategoryDish> get cart {
    return hh;
  }
}
