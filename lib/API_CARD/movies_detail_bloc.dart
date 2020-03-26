import 'package:rxdart/rxdart.dart';
import 'base.dart';
import 'model/movie_detail_model.dart';
class MovieDetailBloc extends BaseBloc<MovieDetailModel> {
  Observable<MovieDetailModel> get movieDetail => fetcher.stream;
  fetchMovieDetail(int movieId) async {
    MovieDetailModel itemModel = await repository.fetchMovieDetail(movieId);
    fetcher.sink.add(itemModel);
  }
}

final movieDetailBloc = MovieDetailBloc();