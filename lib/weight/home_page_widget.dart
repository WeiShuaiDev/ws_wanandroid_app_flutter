import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/http/dio_client.dart';
import 'package:ws_wanandroid_app_flutter/model/index_article_info.dart';
import 'package:ws_wanandroid_app_flutter/model/base_response.dart';
import 'package:ws_wanandroid_app_flutter/model/index_banner_info.dart';
import 'package:ws_wanandroid_app_flutter/util/dialog_util.dart';
import 'package:ws_wanandroid_app_flutter/util/toast_util.dart';
import 'package:ws_wanandroid_app_flutter/weight/article_item_widget.dart';
import 'package:ws_wanandroid_app_flutter/weight/auto_scroll_banner_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with AutomaticKeepAliveClientMixin  {
  int _currentPage = 0; //当前页
  List<IndexBannerInfo> _bannerItems = []; //banner列表
  IndexArticleInfo? _indexData; // 文章列表项目
  final List<ArticleInfo> _articleItems = []; // 文章列表
  final ScrollController _scrollController = ScrollController(); // 滑动监听器

  @override
  void initState() {
    super.initState();
    _requestBanner();
    _requestArticleList(isRefresh: true);
    _scrollController.addListener(() {
      // 滚动到底部时自动加载更多
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _requestArticleList();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  ///请求轮播图接口
  Future<void> _requestBanner() async {
    DioClient()
        .get("banner/json")
        .then((value) => setState(() {
              _bannerItems = ListResponse<IndexBannerInfo>.fromJson(
                          value.data, (json) => IndexBannerInfo.fromJson(json))
                      .data ??
                  [];
            }))
        .catchError((e) {
      ToastUtil.show(msg: "请求失败：${e.toString()}");
    });
  }

  // 请求文章列表接口
  Future<void> _requestArticleList({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 0;
      _articleItems.clear();
    } else {
      ++_currentPage;
      // 请求时展示Loading对话框
      showLoadingDialog(context, canPop: false);
    }
    DioClient().get("article/list/$_currentPage/json").then((value) {
      // 加载更多需要关闭加载对话框
      if (!isRefresh) Navigator.pop(context);
      setState(() {
        _indexData =
            DataResponse<IndexArticleInfo>.fromJson(value.data, (json) => IndexArticleInfo.fromJson(json)).data;
        _articleItems.addAll(_indexData!.datas);
      });
    }).catchError((e) {
      ToastUtil.show(msg: "请求失败：${e.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
        onRefresh: () => _requestArticleList(isRefresh: true),
        child: ListView.builder(
          itemCount: _articleItems.length,
          itemBuilder: (context, index) {
            // 两个接口都拉取成功，才加载页面
            if (_bannerItems.isNotEmpty && _articleItems.isNotEmpty) {
              if (index == 0) {
                return AutoScrollBannerWidget(
                  imageUrls: _bannerItems.map((e) => e.imagePath).toList(),
                  onTap: (pos) => ToastUtil.show(msg: "点击了第${pos + 1}个banner"),
                );
              }
              int itemIndex = index - 1;
              return ArticleItemWidget(articleInfo: _articleItems[itemIndex]);
            }
            return null;
          },
          controller: _scrollController,
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
