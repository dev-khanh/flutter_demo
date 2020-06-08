import 'package:dio/dio.dart';
import 'package:flutterappexample/MVVM/view/base_provide.dart';
import 'package:rxdart/rxdart.dart';
import '../model/github_repo.dart';

class HomeProvide extends BaseProvide {
  final GithubRepo _repo;
  String username = "", password = "";
  String _response = "";

  String get response => _response;
  HomeProvide(this._repo);
  Observable login(){
    return _repo.login(username, password).doOnData((r){
      return response = r.toString();
    }).doOnError((e, stacktrace) {
        if (e is DioError) {
          response = e.response.data.toString();
        }
      },
    ).doOnListen(() {}).doOnDone(() {});
  }
  set response(String response) {
    _response = response;
    notifyListeners();
  }
}
