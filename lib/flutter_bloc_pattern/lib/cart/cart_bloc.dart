import 'dart:async';

import 'package:flutter_bloc_pattern_example/models/cart_item.dart';
import 'package:flutter_bloc_pattern_example/models/product.dart';
import 'package:flutter_bloc_pattern_example/services/cart.dart';
import 'package:rxdart/subjects.dart';

class CartAddition {
  final Product product;
  final int count;
  CartAddition(this.product, [this.count = 1]);
}
class CartBloc {
  final _cart = CartService();
  final _items = BehaviorSubject<List<CartItem>>(seedValue: []);
  final _itemCount = BehaviorSubject<int>(seedValue: 0);
  final _cartAdditionController = StreamController<CartAddition>();
  CartBloc() {
    _cartAdditionController.stream.listen(_handleAddition);
  }
  Sink<CartAddition> get cartAddition => _cartAdditionController.sink;
  Stream<int> get itemCount => _itemCount.stream.distinct();
  Stream<List<CartItem>> get items => _items.stream;
  void dispose() {
    _items.close();
    _itemCount.close();
    _cartAdditionController.close();
  }
  void _handleAddition(CartAddition addition) {
    _cart.add(addition.product, addition.count);
    _items.add(_cart.items);
    _itemCount.add(_cart.itemCount);
  }
}