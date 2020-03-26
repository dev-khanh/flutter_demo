import 'dart:convert';
import 'package:exampledemomovie/model/item_model.dart';
import 'package:exampledemomovie/model/movie_detail_model.dart';
import 'package:exampledemomovie/model/movie_image_model.dart';
import 'package:http/http.dart';

class MovieApiProvider{
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  Future<Item_Model> fetchMovieList(String type) async {
    final response = await client.get("http://api.themoviedb.org/3/movie/$type?api_key=$_apiKey");
    print("DEVK 1: "+ response.request.url.toString());
    print("DEVK 2: "+response.body.toString());
    if (response.statusCode == 200) {
      return Item_Model.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<MovieDetailModel> fetchMovieDetail(int movieId) async {
    final response = await client.get("http://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey");
    print("DEVK 6: "+response.request.url.toString());
    print("DEVK 7: "+response.body.toString());
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<MovieImageModel> fetchMovieImages(int movieId) async {
    final response = await client.get("http://api.themoviedb.org/3/movie/$movieId/images?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MovieImageModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}