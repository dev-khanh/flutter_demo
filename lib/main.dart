import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappexample/MVVM/di/init.dart';
import 'package:flutterappexample/UI_Demo/bag/bag_page.dart';
import 'package:flutterappexample/UI_Demo/flut_store/fruit_app_home_page.dart';
import 'package:flutterappexample/UI_Demo/food/pages/HomePage.dart';
import 'package:flutterappexample/UI_Demo/movies/main.dart';
import 'package:flutterappexample/UI_Demo/showCard/home_page.dart';
import 'package:flutterappexample/UI_Demo/ui_four/ui/home.dart';
import 'package:flutterappexample/UI_Demo/ui_one/main_list.dart';
import 'package:flutterappexample/UI_Demo/ui_three/fitness_app_home_screen.dart';
import 'package:flutterappexample/UI_Demo/ui_tow/demo_ui_two.dart';
import 'package:flutterappexample/bloc_example/demo_three/demo_three.dart';
import 'package:flutterappexample/bloc_example/demo_two/bloc_change.dart';
import 'file:///C:/Users/dqkhanh/Desktop/flutter_demo/lib/bloc_example/demo_one/my_home_page.dart';
import 'file:///C:/Users/dqkhanh/Desktop/flutter_demo/lib/bloc_example/demo_one/simple_bloc_delegate.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  Provider.debugCheckInvalidValueType = null;
//  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DemoThree());
  }
}
