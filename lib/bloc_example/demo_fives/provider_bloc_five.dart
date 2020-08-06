import 'package:flutter/material.dart';
import 'package:flutterappexample/bloc_example/demo_fives/bloc_five.dart';

class ProviderBlocFive extends InheritedWidget{
  final BlocFive bloc = BlocFive();
  ProviderBlocFive({Key key, Widget child}): super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  static BlocFive of(BuildContext context) => (context.inheritFromWidgetOfExactType(ProviderBlocFive) as ProviderBlocFive).bloc;
}