import 'package:flutter/material.dart';

class BottomBarWidget extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const BottomBarWidget(
      {super.key, required this.currentIndex, required this.onItemSelected});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
        BottomNavigationBarItem(icon: Icon(Icons.article), label: "公众号"),
        BottomNavigationBarItem(icon: Icon(Icons.heart_broken), label: "其他")
      ],
      onTap: widget.onItemSelected,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: widget.currentIndex,
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    );
  }
}
