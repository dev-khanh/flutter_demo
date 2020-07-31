import 'package:flutterappexample/UI_Demo/movies/src/models/movie_model.dart';
import 'package:rxdart/rxdart.dart';


import '../mock_data.dart';

class MoviesBloc{


  final _pagePositionProvider = BehaviorSubject<double>();
  final _moviesLoader = BehaviorSubject<List<MovieModel>>();

  double pageNum = 0;

  Observable<double> get pagePosition => _pagePositionProvider.stream;
  Observable<List<MovieModel>> get fetchMovies => _moviesLoader.stream;

  Function(double) get pushPagePosition=> _pagePositionProvider.sink.add;

  void init(){
    var mockData = MockData();
    _moviesLoader.sink.add(mockData.getMovies());
  }

  changePageNum(double num){
    pageNum = num;
  }

  onDispose(){
    _pagePositionProvider.close();
    _moviesLoader.close();
  }
}