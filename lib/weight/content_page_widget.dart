import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/weight/home_page_widget.dart';
import 'package:ws_wanandroid_app_flutter/weight/wx_page_widget.dart';

class ContentPageWidget extends StatefulWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const ContentPageWidget(
      {super.key, required this.pageController, required this.onPageChanged});

  @override
  State<ContentPageWidget> createState() => _ContentPageWidgetState();
}

class _ContentPageWidgetState extends State<ContentPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView(
      onPageChanged: widget.onPageChanged,
      controller: widget.pageController,
      children: const [
        Center(
          child: HomePageWidget(), //首页
        ),
        Center(
          child: WxPageWidget(), //公众号
        ),
        Center(
          child: Text("其他"),
        )
      ],
    ));
  }
}
