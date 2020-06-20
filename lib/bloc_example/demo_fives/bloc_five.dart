import 'package:flutterappexample/bloc_example/demo_fives/validators.dart';
import 'package:rxdart/rxdart.dart';
class BlocFive with Validators{
  final BehaviorSubject _emailController = BehaviorSubject<String>();
  final BehaviorSubject _passController = BehaviorSubject<String>();
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passController.sink.add;
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get pass => _passController.stream.transform(validatePass);
  Stream<bool> get submitValid => Observable.combineLatest2(email, pass, (email, password) => true);
  setOnClickButton(){
    _emailController.value;
    _passController.value;
  }
  void dispose() {
    _emailController.close();
    _passController.close();
  }
}