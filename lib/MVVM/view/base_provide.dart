import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
class BaseProvide with ChangeNotifier {
  CompositeSubscription compositeSubscription = CompositeSubscription();
  addSubscription(StreamSubscription subscription) {
    compositeSubscription.add(subscription);
  }
  @override
  void dispose() {
    if (!compositeSubscription.isDisposed) {
      compositeSubscription.dispose();
    }
    super.dispose();
  }
}
