import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

enum CounterEvent {
  increment,
  decrement,
}
class CounterBloc extends Bloc<CounterEvent, int> with ChangeNotifier{
  CounterBloc() : super(0);
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
  static CounterBloc of(BuildContext context) => Provider.of<CounterBloc>(context);
}

