import 'dart:async';
import 'model/item_model.dart';
import 'model/movie_detail_model.dart';
import 'model/movie_image_model.dart';
import 'movie_api_provider.dart';
class Repository {
  final moviesApiProvider = MovieApiProvider();
  Future<ItemModel> fetchMovieList(String type) => moviesApiProvider.fetchMovieList(type);
  Future<MovieDetailModel> fetchMovieDetail(int movieId) => moviesApiProvider.fetchMovieDetail(movieId);
  Future<MovieImageModel> fetchMovieImages(int movieId) => moviesApiProvider.fetchMovieImages(movieId);
}