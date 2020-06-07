import 'actor_model.dart';
class MovieModel{
  final String title;
  final String overView;
  final String imagePath;
  final String language;
  final String genres;
  final double rating;
  final double movieLength;
  final List<ActorModel> casting;
  MovieModel({this.title, this.overView, this.imagePath, this.language, this.genres, this.rating, this.movieLength, this.casting});
}