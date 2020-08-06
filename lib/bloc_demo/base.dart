import 'dart:async';
import 'event/base_event.dart';
abstract class BaseBloc {
  GlobalBloc globalBloc;
  void injectBloc(GlobalBloc bloc) {
    globalBloc = bloc;
    globalBloc.globalStream.listen((event) {
      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);

  void emit(BaseEvent event) {
    if (globalBloc == null) {
      throw Exception("GlobalBloc can not be null");
    }
    globalBloc.globalSink.add(event);
  }
}

class GlobalBloc extends BaseBloc {
  final globalController = StreamController<BaseEvent>.broadcast();

  Stream get globalStream => globalController.stream;
  Sink get globalSink => globalController.sink;

  void emit(BaseEvent data) {
    globalSink.add(data);
  }

  void dispose() {
    globalController.close();
  }

  @override
  void dispatchEvent(BaseEvent event) {
    // TODO: implement dispatchEvent
  }
}