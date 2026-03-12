import 'package:flutter/material.dart';
import 'features/firstscreen.dart';
import 'features/home/presentation/page/home_screen.dart';
import 'core/services/local/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.init();

  runApp(const BookiaApp());
}

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {

    String? token = SharedPref.getToken();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: token != null ? const HomeScreen() : const FirstScreen(),
    );
  }
}