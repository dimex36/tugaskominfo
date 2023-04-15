import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkSource {
  static Dio dio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: Duration(seconds: 5),
      sendTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    );

    dio.interceptors.add(PrettyDioLogger());

    return dio;
  }

  static Dio mockDio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: 'https://mock.apidog.com/m1/361910-0-default',
      connectTimeout: Duration(seconds: 5),
      sendTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    );

    return dio;
  }
}
