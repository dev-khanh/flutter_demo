import 'package:dartin/dartin.dart';
import 'package:flutterappexample/MVVM/helper/shared_preferences.dart';
import 'package:flutterappexample/MVVM/model/github_repo.dart';
import 'package:flutterappexample/MVVM/model/github_service.dart';
import 'package:flutterappexample/MVVM/viewmodel/home_provide.dart';
import 'init.dart';
const testScope = DartInScope('test');
final viewModelModule = Module([
  factory<HomeProvide>(({params}) => HomeProvide(get())),
])..withScope(testScope, []);
final repoModule = Module([
  factory<GithubRepo>(({params}) => GithubRepo(get(), get())),
]);
final remoteModule = Module([
  factory<GithubService>(({params}) => GithubService()),
]);
final localModule = Module([
  single<SpUtil>(({params}) => spUtil),
]);
final appModule = [viewModelModule, repoModule, remoteModule, localModule];