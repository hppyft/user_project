import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:user_project/shared/const/environment_utils.dart';

class BaseDio extends DioForNative {
  BaseDio() {
    options.baseUrl = EnvironmentUtils.baseApiUrl;
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
