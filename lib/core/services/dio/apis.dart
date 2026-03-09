import 'dio_provider.dart';

class Apis {

  static Future login(String email, String password) async {

    final response = await DioProvider.dio.post(
      "/login",
      data: {
        "email": email,
        "password": password,
      },
    );

    return response.data;
  }

}