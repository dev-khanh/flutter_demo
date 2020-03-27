import 'package:flutter/material.dart';

import '../model/itemmodel.dart';
import '../movies_list_bloc.dart';

class My_List extends StatelessWidget{
  static String topRated ="top_rated";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildMyList(context));
  }
  _buildMyList(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Text("My List", style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: "Muli"))),
                Icon(Icons.arrow_forward, color: Colors.black,)
              ],
            ),
          ),
          MovieListView(type: topRated, onItemInteraction: (movieId) {
            _navigateToMovieDetail(context, movieId);
          },)
        ],
      ),
    );
  }
  _navigateToMovieDetail(BuildContext context, int movieId){

  }
}
class MovieListView extends StatefulWidget {
  final String type;
  final Function(int movieId) onItemInteraction;
  MovieListView({Key key, this.type, this.onItemInteraction}) : super(key: key);
  @override
  State createState() => _MovieListViewState();
}
class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList(widget.type);
    return StreamBuilder(
      stream: movieListBloc.movieList,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return buildContent(snapshot, context);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Container(padding: EdgeInsets.all(20.0), child: Center(child: CircularProgressIndicator()));
      },
    );
  }
  Widget buildContent(AsyncSnapshot<ItemModel> snapshot, BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(height: width / 1.75, margin: EdgeInsets.only(bottom: 10, top: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data.results.length > 10 ? 10 : snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                if (widget.onItemInteraction != null) {
                  widget.onItemInteraction(snapshot.data.results[index].id);
                } else {
                  debugPrint("No handle");
                }
              },
              child: _buildItem(snapshot.data.results[index].poster_path, snapshot.data.results[index].backdrop_path, width / 4, index == 0)
          );
        },
      ),
    );
  }
  _buildItem(String imagePath, String backdropPath, double itemHeight, bool isFirst) {
    return Card(clipBehavior: Clip.antiAliasWithSaveLayer, elevation: 10.0,
      margin: EdgeInsets.only(left: isFirst ? 20 : 10, right: 10, bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Image.network('https://image.tmdb.org/t/p/w500$imagePath',
        fit: BoxFit.cover,
        width: itemHeight * 4 / 3,
        height: itemHeight / 2,),
    );
  }
}