import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/movies/src/bloc/movie_card_bloc_provider.dart';
import 'package:flutterappexample/UI_Demo/movies/src/models/movie_model.dart';
import 'package:flutterappexample/UI_Demo/movies/src/widgets/animated_movie_card.dart';
import 'package:flutterappexample/UI_Demo/movies/src/widgets/movie_card.dart';
import '../custom_fab_shape.dart';
import 'movie_details_screen.dart';
class MoviesScreen extends StatelessWidget {
  final PageController pageController = PageController(viewportFraction: 0.65);
  final SCALE_FRACTION = 0.7;
  final FULL_SCALE = 1.0;
  final double viewPortFraction = 0.5;
  @override
  Widget build(BuildContext context) {
    final movieBloc = MoviesProvider.of(context);
    movieBloc.init();
    pageController.addListener( () {
      movieBloc.pushPagePosition(pageController.page);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            'Most recent',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: StreamBuilder<List<MovieModel>>(
                stream: movieBloc.fetchMovies,
                builder: (context, AsyncSnapshot<List<MovieModel>> moviesSnapshot) {
                  if(!moviesSnapshot.hasData){
                    return Container();
                  }
                  return StreamBuilder<double>(
                    initialData: movieBloc.pushPagePosition(movieBloc.pageNum),
                    stream: movieBloc.pagePosition,
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return Container();
                      }
                      return PageView.builder(
                        onPageChanged: (value) {
                          movieBloc.changePageNum(value.toDouble());
                        },
                        controller: pageController,
                        itemCount: moviesSnapshot.data.length,
                        itemBuilder: (context, index) {
                          double scale =
                          max(SCALE_FRACTION,
                            (FULL_SCALE - (index - snapshot.data).abs()) +
                              viewPortFraction);
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(currentMovie: moviesSnapshot.data[index])));
                            },
                            child: AnimatedMovieCard(
                              scale: scale <= 1.0 ? scale : 1.0,
                              content: MovieCard(
                                imageScale: scale >= 1.5 ? 1.0 : (1.0 + (1.5 - scale)),
                                imagePath: moviesSnapshot.data[index].imagePath,
                                title: moviesSnapshot.data[index].title,
                                genres: moviesSnapshot.data[index].genres,
                              ),
                            ),
                          );
                        }
                      );
                    }
                  );
                }
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        child: Icon(Icons.search),
        shape: CustomBorder(),
        onPressed: () {},
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 16.0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.movie_creation),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.menu),
            title: new Text(''),
          ),
        ],
      ),
    );
  }
}