import 'package:flutter/material.dart';
import 'Widget/category.dart';
import 'Widget/slideshow.dart';
import 'my_scroll_behavior.dart';
import 'view/custom_dialog.dart';
import 'view/list_tile_center.dart';

class Home extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<Home> with AutomaticKeepAliveClientMixin<Home>{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Image.asset('res/image/icon_netflix.png'), centerTitle: true, brightness: Brightness.light, backgroundColor: Colors.white, elevation: 0.0,
        leading: Icon(Icons.menu, color: Colors.black,), actions: <Widget>[IconButton(icon: Icon(Icons.search, color: Colors.black), onPressed: () => _setOnClickIconSearch())]
      ),
      body:  Container(
        color: Colors.white,
        child: ScrollConfiguration(
            behavior: MyScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SlideShowView(onItemInteraction: (movieId) => _navigateToMovieDetail(context, movieId)),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  MovieCategory(),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  ListTileCenter("My List", "top_rated"),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  ListTileCenter("Popular on Netflix", "popular")
                ],
              ),
            )
        ),
      ),
    );
  }
  _setOnClickIconSearch(){
    print('DEVK Seach');
  }
  _navigateToMovieDetail(BuildContext context, int movieId){
      showDialog(barrierDismissible: false, context: context,
        builder: (BuildContext context) => CustomDialog(title: movieId.toString(), buttonText: "OK")
      );
  }
}