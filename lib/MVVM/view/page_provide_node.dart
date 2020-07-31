import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/MVVM/view/presenter.dart';
import 'package:provider/provider.dart';
abstract class PageProvideNode<T extends ChangeNotifier> extends StatelessWidget implements Presenter {
  final T mProvider;
  PageProvideNode({List<dynamic> params}) : mProvider = inject<T>(params: params);
  Widget buildContent(BuildContext context);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: mProvider,
      child: buildContent(context),
    );
  }
  @override
  void onClick(String action) {}
}