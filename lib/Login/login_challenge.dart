import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login_Challenge extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Challenge',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}
class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _titleContainer = Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/12,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // colors: [
            //   Color(0xFFf45d27),
            //   Color(0xFFf5851f)
            // ]
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Login', style: TextStyle(color: Colors.white, fontSize: 18))
          ]
        ),
      )
    );
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            _titleContainer
//            Container(
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height/2.5,
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [
//                      Color(0xFFf45d27),
//                      Color(0xFFf5851f)
//                    ],
//                  ),
//                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90), topRight: Radius.circular(90))
//              ),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Spacer(),
//                  Align(alignment: Alignment.center, child: Icon(Icons.person, size: 90, color: Colors.white)),
//                  Spacer(),
//                  Align(
//                    alignment: Alignment.bottomRight,
//                    child: Padding(
//                      padding: const EdgeInsets.only(bottom: 32, right: 32),
//                      child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 18)
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
