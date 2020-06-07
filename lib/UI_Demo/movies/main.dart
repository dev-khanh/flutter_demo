import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/movies/src/screens/movies_screen.dart';
import 'src/bloc/movie_card_bloc_provider.dart';
class MyAppMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MoviesProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MoviesScreen()
      )
    );
  }
}