import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/model/wx_article_chapter.dart';

class BlogTabBarWidget extends StatefulWidget {
  final TabController tabController;
  final List<WxArticleChapter> chapterList;

  const BlogTabBarWidget(
      {super.key, required this.tabController, required this.chapterList});

  @override
  State<BlogTabBarWidget> createState() => _BlogTabBarWidgetState();
}

class _BlogTabBarWidgetState extends State<BlogTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: widget.tabController,
        isScrollable: true,
        tabs: widget.chapterList
            .map((chapter) => Tab(text: chapter.name))
            .toList());
  }
}
