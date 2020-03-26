import 'package:exampledemomovie/ui/Widget/movie_list.dart';
import 'package:flutter/material.dart';

import '../house.dart';

class ListTileCenter extends StatefulWidget{
  String data, dataRespon;
  ListTileCenter(this.data, this.dataRespon);
  @override
  State<StatefulWidget> createState() => _setStateList(data, dataRespon);
}
class _setStateList extends State<ListTileCenter>{
  String title, dataResponse;
  _setStateList(this.title, this.dataResponse);
  @override
  Widget build(BuildContext context) {
    return _buildMyList(context);
  }
  _buildMyList(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: <Widget>[
                Expanded(child: Text(title, style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: "Muli"))),
                Icon(Icons.arrow_forward, color: Colors.black,)
              ],
            ),
          ),
          MovieListView(type: dataResponse, onItemInteraction: (movieId) {
            _navigateToMovieDetail(context, movieId);
          },)
        ],
      ),
    );
  }
  _navigateToMovieDetail(BuildContext context, int movieId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => House(movieId: movieId)));
  }
}