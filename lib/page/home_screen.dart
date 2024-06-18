import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/weight/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const DrawerScreen();
  }
}
