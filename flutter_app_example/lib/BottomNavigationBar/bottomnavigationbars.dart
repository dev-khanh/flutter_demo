import 'package:flutter/material.dart';
import 'Business.dart';
import 'Home.dart';
import 'Scholl.dart';
import 'Settings.dart';
class bottomnavigationbars extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SetState();
  }
}
class SetState extends State<bottomnavigationbars>{
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _WidgetOptions = <Widget>[ Home(), Business(), Scholl(), Settings() ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final GlobalKey<ScaffoldState> _GlobalKeyState = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationBar'), actions: <Widget>[IconButton(icon: Icon(Icons.send), onPressed: _onPressedShowButtom)]),
      key: _GlobalKeyState,
      body: Center(child: _WidgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('Scholl')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
  _onPressedShowButtom(){
    final _snackBar = SnackBar(
      content: Text('Ok SnackBar'),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      action: SnackBarAction(label: 'OK', onPressed: (){
        print('OK');
      }),
    );
    _GlobalKeyState.currentState.showSnackBar(_snackBar);
  }
}
