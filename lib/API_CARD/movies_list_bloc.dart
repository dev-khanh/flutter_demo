import 'package:rxdart/rxdart.dart';
import 'base.dart';
import 'model/itemmodel.dart';
class MovieListBloc extends BaseBloc<ItemModel> {
  Observable<ItemModel> get movieList => fetcher.stream;
  fetchMovieList(String type) async {
    ItemModel itemModel = await repository.fetchMovieList(type);
    fetcher.sink.add(itemModel);
  }
}
final movieListBloc = MovieListBloc();