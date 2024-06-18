import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/page/splash_screen.dart';
import 'package:ws_wanandroid_app_flutter/page/home_screen.dart';
import 'http/dio_client.dart';

void main() {
  DioClient.init("https://www.wanandroid.com/");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WSWanAndroidAppFlutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
      ),
      home: const SplashScreen(),
      routes: {'/home': (context) => const HomeScreen()},
    );
  }
}
