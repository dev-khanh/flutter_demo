import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'home.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<Login> {
  TextEditingController _textFieldControllerName = TextEditingController();
  TextEditingController _textFieldControllerPass = TextEditingController();

  final FocusNode _ageFocus = FocusNode();
  final FocusNode _heightFocus = FocusNode();
  _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool check = true;
  final User user =  new User();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(focusNode: _ageFocus, textInputAction: TextInputAction.next, controller: _textFieldControllerName, obscureText: false, style: style, autocorrect: false, onSubmitted: (name){_fieldFocusChange(context, _ageFocus, _heightFocus);}, onChanged: (name){this.user._userName = name;  },
      decoration: InputDecoration(contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), hintText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(focusNode: _heightFocus, controller: _textFieldControllerPass, obscureText: check, style: style, autocorrect: false, onChanged: (pass){this.user._passWord = pass; },
      decoration: InputDecoration(contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), hintText: "Password", border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(elevation: 5.0, borderRadius: BorderRadius.circular(30.0), color: Color(0xff01A0C7),
      child: MaterialButton(minWidth: MediaQuery.of(context).size.width, padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0), onPressed: () => _setOnClickLogin(context),
        child: Text("Login", textAlign: TextAlign.center, style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final _mContainer = new Container(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 155.0, child: Image.asset("assets/images/imagestext.png", fit: BoxFit.contain)),
                SizedBox(height: 45.0), emailField,
                SizedBox(height: 25.0), passwordField,
                SizedBox(height: 35.0), loginButon,
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      )
    );
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _mContainer,
        ],
      ),
    );
  }
  _setOnClickLogin(BuildContext context){
    if(this.user._userName != null && this.user._passWord != null){
      if((this.user._userName == "admin") && (this.user._passWord == "0032495")){
        print('DEVK Name: ${this.user._userName}    -   ${this.user._passWord}');
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home())).then((value) {
          setState(() {
            _textFieldControllerName.text = "";
            _textFieldControllerPass.text = "";
            this.user._userName = "";
            this.user._passWord = "";
          });
        });
      }else{
        print('DEVK Name: ${this.user._userName}    -   ${this.user._passWord}');
        Toast.show("Login unsuccessful !!! ", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    }else{
      Toast.show("Please enter a password and usernam !!!", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }
  }
}
class User{
  String _userName;
  String _passWord;
}