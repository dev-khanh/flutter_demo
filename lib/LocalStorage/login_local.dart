import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login_Local extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<Login_Local> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  bool isLoggedIn = false;
  String name = '';
  @override
  void initState() {
    super.initState();
    autoLogIn();
  }
  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');
    print('DEVK UserID: '+ userId);
    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        name = userId;
      });
      return;
    }
  }
  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    setState(() {
      name = '';
      isLoggedIn = false;
    });
  }
  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', nameController.text);
    setState(() {
      name = nameController.text;
      isLoggedIn = true;
    });
    nameController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            !isLoggedIn ? TextField(
              textAlign: TextAlign.center,
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Please enter your name'),
            ) : Text('You are logged in as $name'),
            SizedBox(height: 10.0),
            RaisedButton(onPressed: () {
                isLoggedIn ? logout() : loginUser();
              },
              child: isLoggedIn ? Text('Logout') : Text('Login'),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}