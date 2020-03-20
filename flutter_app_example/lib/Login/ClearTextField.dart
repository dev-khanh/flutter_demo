import 'package:flutter/material.dart';

class ClearTextField extends StatefulWidget {
  @override
  ClearTextFieldState createState() {
    return new ClearTextFieldState();
  }
}

class ClearTextFieldState extends State<ClearTextField> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final FocusNode _ageFocus = FocusNode();
    final FocusNode _heightFocus = FocusNode();
    final FocusNode _weightFocus = FocusNode();
    _fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
//      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
    var _mainPartView = Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            focusNode: _ageFocus,
            onFieldSubmitted: (term){
              _fieldFocusChange(context, _ageFocus, _heightFocus);
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            focusNode: _heightFocus,
            onFieldSubmitted: (term) {
              _fieldFocusChange(context, _heightFocus, _weightFocus);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      body: Center(
        child: Padding( padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: <Widget>[
              _mainPartView,
            ],
          )
        ),
      ),
    );
  }
}
