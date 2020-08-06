import 'dart:async';
class Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (String email, EventSink<String> sink){
        if(email.contains('@')){
          sink.add(email);
        }else{
          sink.addError("not mail");
        }
      }
  );
  final validatePass = StreamTransformer<String, String>.fromHandlers(
      handleData: (String pass, EventSink<String> sink){
        if(pass.length > 3){
          sink.add(pass);
        }else{
          sink.addError("not pass");
        }
      }
  );
}