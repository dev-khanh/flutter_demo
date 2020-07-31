import 'package:dartin/dartin.dart';
import 'package:flutterappexample/MVVM/di/modules.dart';
import 'package:flutterappexample/MVVM/helper/shared_preferences.dart';
SpUtil spUtil;
init() async {
  spUtil = await SpUtil.getInstance();
  startDartIn(appModule);
}