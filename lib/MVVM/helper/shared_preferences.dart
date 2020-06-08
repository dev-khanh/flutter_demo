import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
class SpUtil {
  static SpUtil _instance;
  static Future<SpUtil> get instance async {
    return await getInstance();
  }
  static SharedPreferences _spf;
  SpUtil._();
  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }
  static Future<SpUtil> getInstance() async  {
    if (_instance == null) {
      _instance = new SpUtil._();
      await _instance._init();
    }
    return _instance;
  }
  static bool _beforCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }
  getString(String key) {
    if (_beforCheck()) return null;
    return _spf.getString(key);
  }
  Future<bool> putString(String key, String value) {
    if (_beforCheck()) return null;
    return _spf.setString(key, value);
  }
}