
import 'package:flutterappexample/demo/model/item_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base.dart';

class MovieListBloc extends BaseBloc<Item_Model>{
  Observable<Item_Model> get movieList => fetcher.stream;
  fetchMovieList(String type) async{
    Item_Model item_model = await repository.fetchMovieList(type);
    fetcher.sink.add(item_model);
  }
}
final movieListBloc = MovieListBloc();