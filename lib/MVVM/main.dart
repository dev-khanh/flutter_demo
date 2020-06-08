import 'package:flutter/material.dart';
import 'package:flutterappexample/MVVM/di/init.dart';
import 'package:flutterappexample/MVVM/view/page_provide_node.dart';
import 'package:flutterappexample/MVVM/view/presenter.dart';
import 'package:flutterappexample/main.dart';
import 'package:provider/provider.dart';
import 'helper/toast.dart';
import 'helper/widget_utils.dart';
import 'viewmodel/home_provide.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM-Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends PageProvideNode<HomeProvide> {
  @override
  Widget buildContent(BuildContext context) {
    return _HomeContentPage(mProvider);
  }
}

class _HomeContentPage extends StatefulWidget {
  final HomeProvide provide;
  _HomeContentPage(this.provide);
  @override
  State<StatefulWidget> createState() {
    return _HomeContentState();
  }
}

class _HomeContentState extends State<_HomeContentPage> with TickerProviderStateMixin<_HomeContentPage> implements Presenter {
  HomeProvide mProvide;
  static const ACTION_LOGIN = "login";
  @override
  void initState() {
    super.initState();
    mProvide = widget.provide;
  }
  @override
  void onClick(String action) {
    mProvide.username = "saakhaka@gmail.com";
    mProvide.password = "Khanh@0032495100";
    print("DEVK onClick:" + action);
    if (ACTION_LOGIN == action) {
      login();
    }
  }
  void login() {
    final s = mProvide.login().doOnListen((){}).doOnDone(() {}).listen((_) {
      Toast.show("login success", context, type: Toast.SUCCESS);
    }, onError: (e) {
      dispatchFailure(context, e);
    });
    mProvide.addSubscription(s);
  }
  @override
  Widget build(BuildContext context) {
    print("--------build--------");
    return Material(
      child: Scaffold(
        body: DefaultTextStyle(
            style: TextStyle(color: Colors.black),
            child: Text("data")
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onClick(ACTION_LOGIN);
          },
          child: Text("Red"),
        ),
      ),
    );
  }
}

