import 'package:flutter/material.dart';

import '../models/rest.dart';

class Cart extends ChangeNotifier {
  double _count = 0;
  List<CategoryDish> hh = [];
  bool sortAscending = true;
  bool sorting = false;

  void sortlist(bool ascending) {
    sorting = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 1), () {
      if (ascending) {
        hh.sort(
          (a, b) => a.dishPrice.compareTo(b.dishPrice),
        );
      } else {
        hh.sort(
          (a, b) => b.dishPrice.compareTo(a.dishPrice),
        );
      }
      sortAscending = ascending;
      sorting = false;
      notifyListeners();
    });
  }

  List<CategoryDish> get sortedprice {
    if (sortAscending) {
      return List.from(hh);
    } else {
      return List.from(hh.reversed);
    }
  }

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
