import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/page/home_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'WSWanAndroidAppFlutter',
          style: TextStyle(
              color: Colors.black87,
              fontSize: 28.0,
              fontWeight: FontWeight.bold)
        ),
      ),
    );
  }
}
