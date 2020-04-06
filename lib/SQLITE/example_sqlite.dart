import 'package:flutter/material.dart';
import 'add_user_dialog.dart';
import 'database/model/user.dart';
import 'home_presenter.dart';
import 'user_list.dart';

class Example_sqlite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> implements HomeContract{
  HomePresenter homePresenter;
  @override
  void initState() {
    super.initState();
    homePresenter = new HomePresenter(this);
    homePresenter.getUser();
  }
  displayRecord() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: _buildTitle(context),
        actions: _buildActions(),
      ),
      body: new FutureBuilder<List<User>>(
        future: homePresenter.getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          var data = snapshot.data;
          return snapshot.hasData ? new UserList(data, homePresenter) : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
  Widget _buildTitle(BuildContext context) {
    return new InkWell(
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text('User Database', style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
  List<Widget> _buildActions() {
    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.group_add, color: Colors.white),
        onPressed: _openAddUserDialog,
      ),
    ];
  }
  Future _openAddUserDialog() async {
    showDialog(context: context, builder: (BuildContext context) =>
        new AddUserDialog().buildAboutDialog(context, this, false, null),
    );
    setState(() {});
  }
  @override
  void screenUpdate() {
    setState(() {});
  }
}
