import 'dart:async';
import 'package:flutterappexample/bloc_example/demo_three/event.dart';
String myName;
void switchIdentity(t) {
  if (myName == 'DEVK') {
    myName = 'Quoc Khanh';
  }
}
class BlocStateChang{
  var _blocControll = StreamController<Event>();
  Function(Event) get feeEventData => _blocControll.sink.add;
  Stream<Event> get streamEvent => _blocControll.stream;
  BlocStateChang() {
    streamEvent.listen(switchIdentity);
  }
  dispose() {
    _blocControll?.close();
  }
}
BlocStateChang blocStateChang = BlocStateChang();
