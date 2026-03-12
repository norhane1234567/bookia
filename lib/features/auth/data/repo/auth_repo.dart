import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookia/core/services/local/shared_pref.dart';

class AuthRepo {

  Future<Map<String, dynamic>> register(
      String name,
      String email,
      String password,
      String confirmPassword) async {

    var response = await http.post(
      Uri.parse("https://codingarabic.online/api/register"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      }),
    );

    print("REGISTER RESPONSE:");
    print(response.body);

    return jsonDecode(response.body);
  }


  Future<Map<String, dynamic>> login(
      String email,
      String password) async {

    var response = await http.post(
      Uri.parse("https://codingarabic.online/api/login"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    print("LOGIN RESPONSE:");
    print(response.body);

    var data = jsonDecode(response.body);

  
    if (data["data"] != null && data["data"]["token"] != null) {
      await SharedPref.setToken(data["data"]["token"]);
    }

    return data;
  }


  Future<Map<String, dynamic>> forgotPassword(String email) async {

    var response = await http.post(
      Uri.parse("https://codingarabic.online/api/forgot-password"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "email": email,
      }),
    );

    print("FORGOT PASSWORD RESPONSE:");
    print(response.body);

    return jsonDecode(response.body);
  }


  Future<Map<String, dynamic>> verifyOtp(
      String email,
      String otp) async {

    var response = await http.post(
      Uri.parse("https://codingarabic.online/api/verify-otp"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "otp": otp,
      }),
    );

    print("VERIFY OTP RESPONSE:");
    print(response.body);

    return jsonDecode(response.body);
  }


  Future<Map<String, dynamic>> resetPassword(
      String email,
      String password,
      String confirmPassword) async {

    var response = await http.post(
      Uri.parse("https://codingarabic.online/api/reset-password"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      }),
    );

    print("RESET PASSWORD RESPONSE:");
    print(response.body);

    return jsonDecode(response.body);
  }
}