import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ws_wanandroid_app_flutter/page/splash_screen.dart';
import 'package:ws_wanandroid_app_flutter/page/home_screen.dart';
import 'package:ws_wanandroid_app_flutter/provider/login_status.dart';
import 'package:ws_wanandroid_app_flutter/util/shared_preferences_util.dart';
import 'http/dio_client.dart';

void main() {
  // 确保Flutter框架初始化完成
  WidgetsFlutterBinding.ensureInitialized();
  DioClient.init("https://www.wanandroid.com/");
  SharedPreferencesUtil.getInstance().then((value) {
    List<String> cookies = value.getStringList("cookies");
    DioClient().setCookies(cookies);
  });
  runApp(ChangeNotifierProvider(
      create: (context) => LoginStatus(), child: const MyApp()));
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
