import 'package:exampledemomovie/Api_RxJava/base.dart';
import 'package:exampledemomovie/model/movie_detail_model.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc extends BaseBloc<MovieDetailModel>{
  Observable<MovieDetailModel> get movieDetail => fetcher.stream;
  fetchMovieDetail(int movieId) async{
    MovieDetailModel movieDetailModel = await repository.fetchMovieDetail(movieId);
    fetcher.sink.add(movieDetailModel);
  }
}
final movieDetailBloc = MovieDetailBloc();