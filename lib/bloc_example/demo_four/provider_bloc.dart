import 'package:flutter/material.dart';
import 'package:flutterappexample/bloc_example/demo_four/example_bloc.dart';
class ProviderBloc extends InheritedWidget{
  ExampleBloc exampleBloc;
  ProviderBloc({Key key, @required this.exampleBloc, Widget child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  static ExampleBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(ProviderBloc) as ProviderBloc).exampleBloc;
}