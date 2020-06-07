import 'package:flutter/material.dart';
import 'movie_card_bloc.dart';
class MoviesProvider extends InheritedWidget {
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  final bloc = MoviesBloc();
  MoviesProvider({Key key, Widget child}) : super(key:key, child: child);
  static MoviesBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(MoviesProvider) as MoviesProvider).bloc;
  }
}