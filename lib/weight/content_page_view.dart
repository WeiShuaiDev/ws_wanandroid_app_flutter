import 'package:flutter/material.dart';

class ContentPageView extends StatefulWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const ContentPageView(
      {super.key, required this.pageController, required this.onPageChanged});

  @override
  State<ContentPageView> createState() => _ContentPageViewState();
}

class _ContentPageViewState extends State<ContentPageView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView(
      onPageChanged: widget.onPageChanged,
      controller: widget.pageController,
      children: const [
        Center(
          child: Text("首页"),
        ),
        Center(
          child: Text("公众号"),
        ),
        Center(
          child: Text("其他"),
        )
      ],
    ));
  }
}
