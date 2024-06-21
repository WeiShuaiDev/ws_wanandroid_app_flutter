import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/http/dio_client.dart';
import 'package:ws_wanandroid_app_flutter/model/base_response.dart';
import 'package:ws_wanandroid_app_flutter/model/wx_article_chapter.dart';
import 'package:ws_wanandroid_app_flutter/util/toast_util.dart';
import 'package:ws_wanandroid_app_flutter/weight/blog_tab_bar_widget.dart';
import 'package:ws_wanandroid_app_flutter/weight/wx_article_list_widget.dart';

class WxPageWidget extends StatefulWidget {
  const WxPageWidget({super.key});

  @override
  State<WxPageWidget> createState() => _WxPageWidgetState();
}

class _WxPageWidgetState extends State<WxPageWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  List<WxArticleChapter> _chapterList = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _requestWxArticleChapters();
  }

  Future<void> _requestWxArticleChapters() async {
    DioClient().get("wxarticle/chapters/json").then((value) {
      if (mounted) {
        setState(() {
          _chapterList = ListResponse<WxArticleChapter>.fromJson(
                  value.data, (json) => WxArticleChapter.fromJson(json)).data ??
              [];
          _tabController =
              TabController(length: _chapterList.length, vsync: this);
        });
      }
    }).catchError((e) {
      ToastUtil.show(msg: "请求失败：${e.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_chapterList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.black),
      );
    } else {
      return Column(
        children: [
          BlogTabBarWidget(
              tabController: _tabController, chapterList: _chapterList),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: _chapterList
                      .map((chapter) =>
                          WxArticleListWidget(chapterId: chapter.id))
                      .toList()))
        ],
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
