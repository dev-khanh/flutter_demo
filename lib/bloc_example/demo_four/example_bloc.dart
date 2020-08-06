import 'dart:async';

import 'package:flutterappexample/bloc_example/demo_four/model_item.dart';
import 'package:rxdart/rxdart.dart';

class ExampleBloc{
  final _itemSubject = BehaviorSubject<List<ModelItem>>();
  Stream<List<ModelItem>> get item => _itemSubject.stream;

  final _addStreamController = StreamController<ModelItem>();
  Sink<ModelItem> get addStreamController => _addStreamController.sink;

  List<ModelItem> _list = List<ModelItem>();
  ExampleBloc(){
    _addStreamController.stream.listen(_handleAddAction);
  }
  _handleAddAction(ModelItem item){
    _itemSubject.add(_list..add(item));
  }
}