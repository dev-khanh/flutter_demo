import 'package:dio/dio.dart';
import 'app_module.dart';
final dio = Dio()..options = BaseOptions(
  baseUrl: 'https://api.github.com/',
  connectTimeout: 30,
  receiveTimeout: 30,
)..interceptors.add(
  AuthInterceptor(),
)..interceptors.add(
  LogInterceptor(responseBody: true, requestBody: true),
);