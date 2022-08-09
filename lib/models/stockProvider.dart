import 'package:flutter/material.dart';
import 'dart:math';

class StockProvider with ChangeNotifier {
  int stockPrice = 0;
  int stockQuantity = 0;
  int stockTotal = 0;

  stockRandomise() {
    stockPrice = Random().nextInt(101);
    print('Its a stock price $stockPrice');
    notifyListeners();
  }

  getquantity() {
    if (stockPrice < 20) {
      stockQuantity += 1;
      stockTotal += stockPrice;
      print('its a stock quantity $stockQuantity');
      notifyListeners();
    }
  }
}
