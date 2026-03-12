import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences prefs;

 
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

 
  static Future<void> setToken(String token) async {
    await prefs.setString("token", token);
  }

  
  static String? getToken() {
    return prefs.getString("token");
  }

  
  static Future<void> removeToken() async {
    await prefs.remove("token");
  }

  
  static Future<void> clear() async {
    await prefs.clear();
  }
}