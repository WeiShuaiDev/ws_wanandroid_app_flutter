import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/weight/bottom_bar_widget.dart';
import 'package:ws_wanandroid_app_flutter/weight/content_page_view.dart';
import 'package:ws_wanandroid_app_flutter/weight/drawer_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemSelected(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("首页", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ContentPageView(
                pageController: _pageController, onPageChanged: _onPageChanged),
            BottomBarWidget(
                currentIndex: _currentIndex, onItemSelected: _onItemSelected)
          ],
        ),
      ),
      drawer: const DrawerScreen(),
    );
  }
}
