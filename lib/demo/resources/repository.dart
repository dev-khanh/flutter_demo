import 'package:flutterappexample/demo/model/item_model.dart';
import 'package:flutterappexample/demo/model/movie_detail_model.dart';
import 'package:flutterappexample/demo/model/movie_image_model.dart';

import 'movie_api_provider.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();
  Future<Item_Model> fetchMovieList(String type) => movieApiProvider.fetchMovieList(type);
  Future<Movie_Detail_Model> fetchMovieDetail(int movieId) => movieApiProvider.fetchMovieDetail(movieId);
  Future<MovieImageModel> fetchMovieImages(int movieId) => movieApiProvider.fetchMovieImages(movieId);
}