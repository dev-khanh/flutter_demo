import 'package:flutterappexample/API_CARD/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'model/base_model.dart';
abstract class BaseBloc<T extends BaseModel> {
  final repository = Repository();
  final fetcher = PublishSubject<T>();
  dispose() {
    fetcher.close();
  }
}