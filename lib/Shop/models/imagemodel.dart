import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageModel extends ChangeNotifier {
  static String label = "Wasi";
  final List _items = [];

  /// The current total price of all items (assuming all items cost $42).
  /// int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(String item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
