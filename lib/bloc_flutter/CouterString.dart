import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

enum Actionss {
  sukien
}
class CouterString extends Bloc<Actionss, String> with ChangeNotifier{
  CouterString() : super('');
  @override
  Stream<String> mapEventToState(Actionss event) async* {
    // switch (event) {
    //   case Actionss.sukien:
    //     yield 'Duong Quoc Khanh';
    //     break;
    //   default:
    //     addError(Exception('unsupported event'));
    // }
    if(event is Actionss){
      yield* addd('Duong Quoc Khanh');
    }
  }
  Stream<String> addd(String name) async*{
    yield name;
  }
  static CouterString of(BuildContext context) => Provider.of<CouterString>(context);
}

