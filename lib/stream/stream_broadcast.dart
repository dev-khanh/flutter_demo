import 'dart:async';

class StreamBroadCast {
  int count = 0;
  StreamController _streamController = StreamController<int>.broadcast();
  var _counterControll = StreamTransformer<int, int>.fromHandlers(handleData: (data, sink) {
    data += 10;
    sink.add(data);
  });
  Stream get streamControll => _streamController.stream.transform(_counterControll);
  void setOnClick() {
    count++;
    _streamController.sink.add(count);
  }

  void dispose() {
    _streamController.close();
  }
}
