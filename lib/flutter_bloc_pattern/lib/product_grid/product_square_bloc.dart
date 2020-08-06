import 'dart:async';
import 'package:flutter_bloc_pattern_example/models/cart_item.dart';
import 'package:flutter_bloc_pattern_example/models/product.dart';
import 'package:rxdart/rxdart.dart';

class ProductSquareBloc {
  final _isInCartSubject = BehaviorSubject<bool>();
  final _cartItemsController = StreamController<List<CartItem>>();
  ProductSquareBloc(Product product) {
    _cartItemsController.stream.map((list) => list.any((item) => item.product == product)).listen((isInCart) => _isInCartSubject.add(isInCart));
  }
  Sink<List<CartItem>> get cartItems => _cartItemsController.sink;
  Stream<bool> get isInCart => _isInCartSubject.stream;
  void dispose() {
    _cartItemsController.close();
    _isInCartSubject.close();
  }
}
