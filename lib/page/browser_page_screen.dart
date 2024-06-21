import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class BrowserPageScreen extends StatefulWidget {
  final String url;
  final String title;

  const BrowserPageScreen({super.key, required this.url, required this.title});

  @override
  State<BrowserPageScreen> createState() => _BrowserPageScreenState();
}

class _BrowserPageScreenState extends State<BrowserPageScreen> {
  bool _isLoading = true;

  void _copyUrlToClipboard() {
    // 复制URL到剪切板
    Clipboard.setData(ClipboardData(text: widget.url));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("链接已复制到剪贴板")));
  }

  void _openBrowser() async {
    // 跳转手机浏览器
    Uri uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
              onPressed: _copyUrlToClipboard,
              icon: const Icon(Icons.copy, color: Colors.black)),
          IconButton(
              onPressed: _openBrowser,
              icon: const Icon(Icons.open_in_browser, color: Colors.black))
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onLoadStart: (InAppWebViewController controller, Uri? url) {
              setState(() {
                _isLoading = true; // 页面开始加载，更新状态为 true
              });
            },
            onLoadStop: (InAppWebViewController controller, Uri? url) {
              setState(() {
                _isLoading = false; // 页面停止加载，更新状态为 false
              });
            },
          ),
          _isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.black,
                )) // 如果正在加载，则显示圆形进度指示器
              : Container(), // 如果不是，则不显示任何内容
        ],
      ),
    );
  }
}
