import 'dart:async';
import 'package:flutterappexample/MVVM/di/dio.dart';
import 'package:rxdart/rxdart.dart';
Future _get(String url, {Map<String, dynamic> params}) async {
  var response = await dio.get(url, queryParameters: params);
  return response.data;
}
Observable get(String url, {Map<String, dynamic> params}) => Observable.fromFuture(_get(url, params: params)).asBroadcastStream();
