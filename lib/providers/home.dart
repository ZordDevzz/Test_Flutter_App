import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
