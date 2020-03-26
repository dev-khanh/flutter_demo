import 'package:exampledemomovie/model/item_model.dart';
import 'package:exampledemomovie/model/movie_detail_model.dart';
import 'package:exampledemomovie/model/movie_image_model.dart';

import 'movie_api_provider.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();
  Future<Item_Model> fetchMovieList(String type) => movieApiProvider.fetchMovieList(type);
  Future<MovieDetailModel> fetchMovieDetail(int movieId) => movieApiProvider.fetchMovieDetail(movieId);
  Future<MovieImageModel> fetchMovieImages(int movieId) => movieApiProvider.fetchMovieImages(movieId);
}