import 'package:flutter/material.dart';
import 'package:flutterappexample/UI_Demo/ui_four/Api_RxJava/movies_list_bloc.dart';
import 'package:flutterappexample/UI_Demo/ui_four/model/item_model.dart';
class MovieCategory extends StatefulWidget {
  @override
  State createState() => _MovieCategoryState();
}
class _MovieCategoryState extends State<MovieCategory> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList("upcoming");
    return StreamBuilder(
      stream: movieListBloc.movieList,
      builder: (context, AsyncSnapshot<Item_Model> snapshot) {
        if (snapshot.hasData) {
          return buildContent(snapshot, context);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Container(padding: EdgeInsets.all(20.0), child: Center(child: CircularProgressIndicator()));
      },
    );
  }
  Widget buildContent(AsyncSnapshot<Item_Model> snapshot, BuildContext context){
    var width = MediaQuery.of(context).size.width;
    return Container(height: width / 4, margin: EdgeInsets.only(bottom: 10, top: 25),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            print('DEVK 4 '+ snapshot.data.results[index].backdrop_path.toString());
            return _buildItem(snapshot.data.results[index].backdrop_path, snapshot.data.results[index].release_date, width / 3, index == 0);
          }
      ),
    );
  }
  _buildItem(String imagePath, String cate, double itemHeight, bool isFirst){
    return Container(
      width: itemHeight * 4 / 3,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer, elevation: 10.0,
        margin: EdgeInsets.only(left: isFirst ? 20 : 10, right: 10, bottom: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: <Widget>[
              Image.network('https://image.tmdb.org/t/p/w500$imagePath', fit: BoxFit.cover, height: constraints.biggest.height, width: constraints.biggest.width),
              Container(
                alignment: Alignment.center,
                width: constraints.biggest.width,
                height: constraints.biggest.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight, end: Alignment.bottomLeft//, stops: [0.1, 0.5, 0.7, 0.9],
                    // colors: [Color(0x99ff0000), Color(0x66ff0000), Color(0x66ff0000), Color(0x99ff0000)],
                  )
                ),
                child: Padding(padding: const EdgeInsets.all(15.0),
                  child: Text(cate, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Muli')),
                ),
              )
            ],
          );
        })
      ),
    );
  }
}