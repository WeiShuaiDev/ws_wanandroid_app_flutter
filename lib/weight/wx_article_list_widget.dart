import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/http/dio_client.dart';
import 'package:ws_wanandroid_app_flutter/model/base_response.dart';
import 'package:ws_wanandroid_app_flutter/model/wx_article_info.dart';
import 'package:ws_wanandroid_app_flutter/util/dialog_util.dart';
import 'package:ws_wanandroid_app_flutter/util/toast_util.dart';
import 'package:ws_wanandroid_app_flutter/weight/wx_article_item_widget.dart';

class WxArticleListWidget extends StatefulWidget {
  final int chapterId;

  const WxArticleListWidget({super.key, required this.chapterId});

  @override
  State<WxArticleListWidget> createState() => _WxArticleListWidgetState();
}

class _WxArticleListWidgetState extends State<WxArticleListWidget>
    with AutomaticKeepAliveClientMixin {
  int _currentPage = 0; //当前页
  final List<ArticleInfo> _wxArticleItems = []; // 公众号列表
  final ScrollController _scrollController = ScrollController(); // 滑动监听器

  @override
  void initState() {
    super.initState();
    _requestWxArticleList(isRefresh: true);
    _scrollController.addListener(() {
      // 滚动到底部时自动加载更多
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _requestWxArticleList();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> _requestWxArticleList({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 0;
      _wxArticleItems.clear();
    } else {
      ++_currentPage;
      // 请求时展示Loading对话框
      showLoadingDialog(context, canPop: false);
    }
    DioClient()
        .get("wxarticle/list/${widget.chapterId}/$_currentPage/json")
        .then((value) {
      // 加载更多需要关闭加载对话框
      if (!isRefresh) Navigator.pop(context);
      setState(() {
        var data = DataResponse<WxArticleInfo>.fromJson(
            value.data, (json) => WxArticleInfo.fromJson(json)).data;
        _wxArticleItems.addAll(data!.datas);
      });
    }).catchError((e) {
      ToastUtil.show(msg: "请求失败：${e.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
        onRefresh: () => _requestWxArticleList(isRefresh: true),
        child: ListView.builder(
          itemCount: _wxArticleItems.length,
          itemBuilder: (context, index) {
            // 两个接口都拉取成功，才加载页面
            if (_wxArticleItems.isNotEmpty) {
              return WxArticleItemWidget(articleInfo: _wxArticleItems[index]);
            } else {
              return null;
            }
          },
          controller: _scrollController,
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
