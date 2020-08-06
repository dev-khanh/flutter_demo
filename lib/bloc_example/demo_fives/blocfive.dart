import 'package:flutter/material.dart';
import 'package:flutterappexample/bloc_example/demo_fives/provider_bloc_five.dart';

import 'bloc_five.dart';

class DemoFive extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateDemoFives();
}
class _StateDemoFives extends State<DemoFive> {
  BlocFive _bloc = BlocFive();
  String DEVK = "DEVK: ";
  @override
  void dispose(){
    super.dispose();
    _bloc.dispose();
    print(DEVK+"dispose");
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ProviderBlocFive(
        child: Center(
          child: Login(),
        ),
      ),
    );
  }
}
class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBlocFive.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              emailField(bloc),
              passwordField(bloc),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitButton(bloc)
            ],
          ),
        )
    );
  }
  Widget emailField(BlocFive bloc) => StreamBuilder<String>(
    stream: bloc.email,
    builder: (context, snap) {
      return TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: bloc.changeEmail,
        decoration: InputDecoration(
            labelText: 'Email address',
            hintText: 'you@example.com',
            errorText: snap.error
        ),
      );
    },
  );
  Widget passwordField(BlocFive bloc) => StreamBuilder<String>(
      stream: bloc.pass,
      builder:(context, snap) {
        return TextField(
          obscureText: true,
          onChanged: bloc.changePass,
          decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Password',
              errorText: snap.error
          ),
        );
      }
  );
  Widget submitButton(BlocFive bloc) => StreamBuilder<bool>(
    stream: bloc.submitValid,
    builder: (context, snap) {
      return RaisedButton(
        onPressed:() => snap.hasData ? bloc.setOnClickButton(context) : null,
        child: Text('Login', style: TextStyle(color: Colors.white),),
        color: Colors.blue,
      );
    },
  );
}