import 'package:flutterappexample/demo/model/movie_detail_model.dart';
import 'package:rxdart/rxdart.dart';

import 'base.dart';

class MovieDetailBloc extends BaseBloc<Movie_Detail_Model>{
  Observable<Movie_Detail_Model> get movieDetail => fetcher.stream;
  fetchMovieDetail(int movieId) async{
    Movie_Detail_Model movieDetailModel = await repository.fetchMovieDetail(movieId);
    fetcher.sink.add(movieDetailModel);
  }
}
final movieDetailBloc = MovieDetailBloc();