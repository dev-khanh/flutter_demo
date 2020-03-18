import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterappexample/screen.dart';
import 'package:toast/toast.dart';

import 'Animation/calculator_animation.dart';
import 'BottomNavigationBar/bottomnavigationbars.dart';
import 'LifeCycle/lifecyle_handling_orientation.dart';
import 'LocalStorage/local_storage.dart';
import 'Login/lo_gin.dart';
import 'Redux/MainRedux.dart';
import 'Redux/redux-simple.dart';
import 'SharedPreferences/shared_preferences.dart';
import 'SliverAppBar/collapsing_toolbar.dart';
import 'navigation/ExtractArgumentsScreen.dart';
import 'navigation/HomeScreen.dart';


import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(title: 'Navigation Basics', home: MyApp(),));
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
//SHOW HIDE SETSTATE STATE
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('MyApp')),
//      body: ExampleState(),
//    );
//  }
//}
//class ExampleState extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    return ExampleSetState();
//  }
//}
//class ExampleSetState extends State<ExampleState>{
//  String _active = '';
//  void _handleTap(){
//    setState(() {
//      _active = 'Duong Quoc Khanh';
//    });
//  }
//  _handleTapHide(){
//    setState(() {
//      _active = '';
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: new Container(
//          child: new Column(
//            children: <Widget>[
//              RaisedButton(onPressed: ()=>_handleTap(), child: Text('Show')),
//              Center(child: Text(_active, style: new TextStyle(fontSize: 30.0))),
//              RaisedButton(onPressed: ()=>_handleTapHide(), child: Text('Hide')),
//            ],
//          ),
//        )
//    );
//  }
//}









// ROW spaceAround CHIA DIEU
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('MyApp')),
//      body: widgetText,
//    );
//  }
//  Widget widgetText = new Container(
//      child: new Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          new Text('Button 1', style: new TextStyle(fontSize: 16.0)),
//          new Text('Button 2', style: new TextStyle(fontSize: 16.0)),
//          new Text('Button 3', style: new TextStyle(fontSize: 16.0)),
//        ],
//      ),
//  );
//}







//CONTAINER MARGIN PADDING
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('MyApp')),
//      body: Container(
//        margin: const EdgeInsets.only(top: 50.0, left: 50.0),
//        padding: const EdgeInsets.only(top: 50.0, left: 50.0),
//        child : new RaisedButton(
//          onPressed: null,
//          child: new Text('Login'),
//        ),
//      ),
//    );
//  }
//}








//NAVIGATION SEND PAGAMS
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: ClassA(),
//      routes: {'DEVK': (context) => ClassB()}
//    );
//  }
//}
//class ClassA extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Class A')),
//      body: new SizedBox(
//          width: 200.0, height: 100.0,
//          child: RaisedButton(onPressed: () => setOnClicks(context) , color: Colors.red, child: Text('Read', style: TextStyle(fontSize: 30.0, color: Colors.yellow)))
//      ),
//    );
//  }
//  setOnClicks(BuildContext context){
//    final List<String> listAdd = <String>['Khanh', 'khai', 'ban'];
//    Navigator.pushNamed(context, 'DEVK', arguments: listAdd);
//  }
//}
//class ClassB extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    List<String> getData = ModalRoute.of(context).settings.arguments;
//    for(int i = 0; i < getData.length; i++){
//      print('DEVK: ' + getData[i]);
//    }
//    return Scaffold(
//      appBar: AppBar(title: Text('Class B')),
//      body: Center(
//        child: RaisedButton(onPressed: (){Navigator.pop(context);}, child: Text('Back')),
//      )
//    );
//  }
//}







//LISTVIEWS THUONG
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(title: const Text("Home")),
//        body: lisviewsMain(),
//      ),
//    );
//  }
//}
//class lisviewsMain extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//      return Scaffold(
//          body: ListView(
//            padding: const EdgeInsets.all(8),
//            children: <Widget>[
//              Container(height: 50, color: Colors.amber[500], child: Center(child: Text('A'))),
//              Container(height: 50, color: Colors.amber[400], child: Center(child: Text('A'))),
//              Container(height: 50, color: Colors.amber[300], child: Center(child: Text('A')))
//            ],
//          ),
//      );
//  }
//}








//LISTVIEWS LIST<STRING>
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(title: Text("Khanh")),
//        body: ListViewCustom()
//      ),
//    );
//  }
//}
//class ListViewCustom extends StatelessWidget{
//  final List<String> entries = <String>['A', 'B', 'C'];
//  final List<MaterialColor> colorCodes = <MaterialColor>[Colors.lightBlue, Colors.red, Colors.yellow];
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: ListView.builder(
//          padding: const EdgeInsets.all(8), itemCount: entries.length,
//          itemBuilder: (BuildContext context, int index){
//            return Container(height: 50, color: (colorCodes[index]), child: Center(child: Text('Entry ${entries[index]}')));
//          }
//      )
//    );
//  }
//}








//LISTVIEW CUSTOM COLOR BACKGOUB
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: MainScreen(), title: 'Devotion', theme: appTheme,
//    );
//  }
//}
//
//ThemeData appTheme = ThemeData(
//  fontFamily: 'Oxygen',
//  primaryColor: Colors.purpleAccent,
//);
//
//class MainScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Devotion'),
//      ),
//      body: ListView(
//        scrollDirection: Axis.vertical,
//        children: <Widget>[
//          CurvedListItem(
//            title: 'Yoga and Meditation for Beginners',
//            time: 'TODAY 5:30 PM',
//            color: Colors.red,
//            nextColor: Colors.green,
//          ),
//          CurvedListItem(
//            title: 'Practice French, English And Chinese',
//            time: 'TUESDAY 5:30 PM',
//            color: Colors.green,
//            nextColor: Colors.yellow,
//          ),
//          CurvedListItem(
//            title: 'Adobe XD Live Event in Europe',
//            time: 'FRIDAY 6:00 PM',
//            color: Colors.yellow,
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//class CurvedListItem extends StatelessWidget {
//  const CurvedListItem({
//    this.title,
//    this.time,
//    this.icon,
//    this.people,
//    this.color,
//    this.nextColor,
//  });
//
//  final String title;
//  final String time;
//  final String people;
//  final IconData icon;
//  final Color color;
//  final Color nextColor;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: nextColor,
//      child: Container(
//        decoration: BoxDecoration(
//          color: color,
//          borderRadius: const BorderRadius.only(
//            bottomLeft: Radius.circular(80.0),
//          ),
//        ),
//        padding: const EdgeInsets.only(
//          left: 32,
//          top: 35.0,
//          bottom: 50,
//        ),
//        child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text(
//                time,
//                style: TextStyle(color: Colors.white, fontSize: 12),
//              ),
//              const SizedBox(
//                height: 2,
//              ),
//              Text(
//                title,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 22,
//                    fontWeight: FontWeight.bold),
//              ),
//              Row(),
//            ]),
//      ),
//    );
//  }
//}








//REFECH API DATABASE
//Future<Album> fetchAlbum() async {
//  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');
//  if (response.statusCode == 200) {
//    return Album.fromJson(json.decode(response.body));
//  } else {
//    throw Exception('Failed to load album');
//  }
//}
//class Album {
//  final int userId;
//  final int id;
//  final String title;
//  Album({this.userId, this.id, this.title});
//  factory Album.fromJson(Map<String, dynamic> json) {
////    print("DEVK: "+ json['title'].toString());
//    return Album(
//      userId: json['userId'],
//      id: json['id'],
//      title: json['title'],
//    );
//  }
//}
//class MyApp extends StatefulWidget {
//  MyApp({Key key}) : super(key: key);
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//class _MyAppState extends State<MyApp> {
//  Future<Album> futureAlbum;
//  @override
//  void initState() {
//    super.initState();
//    futureAlbum = fetchAlbum();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Fetch Data Example',
//      theme: ThemeData(primarySwatch: Colors.blue),
//      home: Scaffold(
//        appBar: AppBar(title: Text('Fetch Data Example')),
//        body: Center(
//          child: FutureBuilder<Album>(
//            future: futureAlbum,
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                return lisviewsMain(snapshot.data.title);
//              } else if (snapshot.hasError) {
//                return Text("${snapshot.error}");
//              }
//              return CircularProgressIndicator();
//            },
//          ),
//        ),
//      ),
//    );
//  }
//}
//class lisviewsMain extends StatelessWidget{
//  final String title;
//  lisviewsMain(this.title);
//  @override
//  Widget build(BuildContext context) {
//      return Scaffold(
//          body: ListView(
//            padding: const EdgeInsets.all(8),
//            children: <Widget>[
//              Container(height: 50, color: Colors.amber[500], child: Center(child: Text(title))),
//            ],
//          ),
//      );
//  }
//}











//JSON OBJECT
//String url = 'https://jsonplaceholder.typicode.com/photos';
//String url1 = 'https://jsonplaceholder.typicode.com/albums/1';
//class DoiTuong{
//  final int albumId, id;
//  final String title, url, thumbnailUrl;
//  DoiTuong({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
//  factory DoiTuong.fromJSON(Map<String, dynamic> json){
//    return DoiTuong(albumId: json['albumId'], id: json['id'], title: json['title'], url: json['url'], thumbnailUrl: json['thumbnailUrl']);
//  }
//}


//Future<List<DoiTuong>> fetchDoiTuong(http.Client client) async{
//  return compute(getDataDoiTuong , (await client.get(url)).body);
//}
//List<DoiTuong> getDataDoiTuong(String respon){
//  return jsonDecode(respon).map<DoiTuong>((json) => DoiTuong.fromJSON(json)).toList();
//}
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Home')),
//      body: FutureBuilder<List<DoiTuong>>(
//        future: fetchDoiTuong(http.Client()),
//        builder: (context, responData){
//          if(responData.hasError) print(responData.error);
//          return responData.hasData ? PhotosList(responData.data) : Center(child: CircularProgressIndicator());
//        }
//      ),
//    );
//  }
//}
//class PhotosList extends StatelessWidget{
//  List<DoiTuong> mDoiTuong;
//  PhotosList(this.mDoiTuong);
//  @override
//  Widget build(BuildContext context) {
//    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){
//      return Image.network(mDoiTuong[index].thumbnailUrl);
//    });
//  }
//}
// JSON two
//class DoiTuong1{
//  final int userId, id;
//  final String title;
//  DoiTuong1({this.userId, this.id, this.title});
//  factory DoiTuong1.fromJSONFromMaps(Map<String, dynamic> json){
//    return DoiTuong1(userId: json['userId'], id: json['id'], title: json['title']);
//  }
//}
//Future<DoiTuong1> fetchDoiTuong1() async {
//  return DoiTuong1.fromJSONFromMaps(json.decode((await http.get(url1)).body));
//}
//class MyApp extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('sss')),
//      body: FutureBuilder<DoiTuong1>(
//        future: fetchDoiTuong1(),
//        builder: (context, jsonGetData){
//          return jsonGetData.hasData ? fuctionShowListItem(jsonGetData.data.title) : Center(child: CircularProgressIndicator());
//        },
//      ),
//    );
//  }
//}
//class fuctionShowListItem extends StatelessWidget{
//  String title;
//  fuctionShowListItem(this.title);
//  @override
//  Widget build(BuildContext context) {
//    return Text(title);
//  }
//}




