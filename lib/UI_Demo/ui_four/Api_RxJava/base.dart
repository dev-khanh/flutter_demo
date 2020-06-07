import 'package:flutterappexample/UI_Demo/ui_four/model/base_model.dart';
import 'package:flutterappexample/UI_Demo/ui_four/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends BaseModel>{
  final repository =  Repository();
  final fetcher = PublishSubject<T>();
  dispose(){
    fetcher.close();
  }
}