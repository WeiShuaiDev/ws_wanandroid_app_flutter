import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF222222)),
              child: Text(
                '用户名称',
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
          ListTile(
            leading: Icon(Icons.score),
            title: Text('我的积分'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('系统设置'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('退出登录'),
          )
        ],
      ),
    );
  }
}
