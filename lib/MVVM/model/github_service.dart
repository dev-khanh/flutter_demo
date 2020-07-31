import 'package:flutterappexample/MVVM/helper/net_utils.dart';
import 'package:rxdart/rxdart.dart';

class GithubService {
  Observable login() => get("user");
}