import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String seletedItem = '1';
  final List<Map<String, dynamic>> _items = [
    {'id': '1', 'title': 'Item 1'},
    {'id': '2', 'title': 'Item 2'},
    {'id': '3', 'title': 'Item 3'},
    {'id': '4', 'title': 'Item 4'},
  ];

  List<Map<String, dynamic>> get items {
    return [..._items];
  }

  void addItem(Map<String, dynamic> item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  void selectItem(String? id) {
    if (id == null) return;
    seletedItem = id;
    notifyListeners();
  }
}
