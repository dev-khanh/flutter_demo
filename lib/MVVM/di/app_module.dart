import 'package:dio/dio.dart';
import 'package:flutterappexample/MVVM/di/init.dart';
import '../helper/constants.dart';
class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    final token = spUtil.getString(KEY_TOKEN);
    options.headers.update(
      "Authorization",
      (_) => token,
      ifAbsent: () => token,
    );
    return super.onRequest(options);
  }
}