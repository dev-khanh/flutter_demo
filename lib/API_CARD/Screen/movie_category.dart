import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../my_scroll_behavior.dart';
import 'category.dart';

class Movie_Category extends StatefulWidget {
  @override
  State createState() => _MyHomePageState();
}
class _MyHomePageState extends State<Movie_Category> with AutomaticKeepAliveClientMixin<Movie_Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("res/graphic/icon_netflix.png"),
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(Icons.menu, color: Colors.black,),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black, // Here
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10)),
                MovieCategory(),
                Padding(padding: EdgeInsets.only(top: 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}