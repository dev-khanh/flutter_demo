import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/bloc_example/demo_fives/validators.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import 'home.dart';
class BlocFive with Validators{
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passController = BehaviorSubject<String>();
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get pass => _passController.stream.transform(validatePass);
  Stream<bool> get submitValid => Observable.combineLatest2(email, pass, (email, password) => true);
//  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) => true);
  setOnClickButton(BuildContext context){
    final validEmail = _emailController.value;
    final validPassword = _passController.value;
    print('DEVK Email: $validEmail');
    print('DEVK Password: $validPassword');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
  }
  void dispose() {
    print("DEVK ======> dispose");
    _emailController.close();
    _passController.close();
  }
  static BlocFive of(BuildContext context) => Provider.of<BlocFive>(context);
}