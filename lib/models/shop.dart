import 'package:flutter/material.dart';
import 'package:learn/models/peoduct.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Product",
      price: 29.9,
      description: "description",
      image: "assets/7.png",
    ),
    Product(
      name: "Product",
      price: 999.9,
      description: "description",
      image: "assets/6.png",
    ),
    Product(
      name: "Product",
      price: 59.9,
      description: "description",
      image: "assets/3.jpg",
    ),
    Product(
      name: "Product",
      price: 14.9,
      description: "description",
      image: "assets/4.webp",
    ),
  ];
  List<Product> _cart = [];

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void RemoveFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
