import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/model/index_article_info.dart';
import 'package:ws_wanandroid_app_flutter/page/browser_page_screen.dart';

class ArticleItemWidget extends StatefulWidget {
  final ArticleInfo articleInfo;

  const ArticleItemWidget({super.key, required this.articleInfo});

  @override
  State<ArticleItemWidget> createState() => _ArticleItemWidgetState();
}

class _ArticleItemWidgetState extends State<ArticleItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        elevation: 1,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.topLeft,
              child: Text(
                widget.articleInfo.title,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 4.0),
            Row(children: [
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                  child: Text(
                widget.articleInfo.author,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              )),
              Text(
                widget.articleInfo.superChapterName,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 12.0),
              Text(
                widget.articleInfo.niceDate,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 12.0)
            ]),
            const SizedBox(height: 8.0)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BrowserPageScreen(
            url: widget.articleInfo.link,
            title: widget.articleInfo.title,
          );
        }));
      },
    );
  }
}
