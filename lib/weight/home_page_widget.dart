import 'package:flutter/cupertino.dart';
import 'package:ws_wanandroid_app_flutter/http/dio_client.dart';
import 'package:ws_wanandroid_app_flutter/model/base_response.dart';
import 'package:ws_wanandroid_app_flutter/weight/auto_scroll_banner_widget.dart';
import 'package:ws_wanandroid_app_flutter/model/banner.dart' as model;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _requestBanner();
  }

  void _requestBanner() {
    DioClient().get("banner/json").then((value) => setState(() {
          var bannerLists = ListResponse<model.Banner>.fromJson(
              value.data, (json) => model.Banner.fromJson(json)).data;
          if (bannerLists != null && bannerLists.isNotEmpty) {
            _imageUrls.clear();
            for (var element in bannerLists) {
              _imageUrls.add(element.imagePath);
            }
          }
        }));
  }

  void _bannerTap(index) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoScrollBannerWidget(imageUrls: _imageUrls, onTap: _bannerTap)




      ],
    );
  }
}
