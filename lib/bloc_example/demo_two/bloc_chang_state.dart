import 'dart:async';

class BlocChangState{
  var _blocChangControll = StreamController<String>.broadcast();
  Function(String) get feedBlocData => _blocChangControll.sink.add;
  Stream<String> get stream => _blocChangControll.stream;
  dispose() {
    _blocChangControll?.close();
  }
}
BlocChangState changState = BlocChangState();