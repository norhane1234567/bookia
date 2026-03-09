import 'package:dio/dio.dart';

class DioProvider {

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://your-api-url.com/api/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Accept": "application/json",
      },
    ),
  );

}