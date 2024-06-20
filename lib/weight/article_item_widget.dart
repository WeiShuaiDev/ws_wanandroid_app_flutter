import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/model/article_info.dart';

class ArticleItemWidget extends StatefulWidget {
  final Datas data;

  const ArticleItemWidget({super.key, required this.data});

  @override
  State<ArticleItemWidget> createState() => _ArticleItemWidgetState();
}

class _ArticleItemWidgetState extends State<ArticleItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.white,
        elevation: 4,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.topLeft,
              child: Text(
                widget.data.title,
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
                widget.data.author,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              )),
              Text(
                widget.data.superChapterName,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(width: 12.0),
              Text(
                widget.data.niceDate,
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
          return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: const Text('文章阅读页'));
        }));
      },
    );
  }
}
