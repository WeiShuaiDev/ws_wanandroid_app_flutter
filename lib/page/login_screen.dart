import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/page/register_screen.dart';
import 'package:ws_wanandroid_app_flutter/util/toast_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    //登录校验逻辑
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      //发起登录请求
      ToastUtil.show(msg: "当前登录的用户名：$username → 密码：$password");
    } else {
      ToastUtil.show(msg: "用户名或密码不能为空");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('登录页', style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: '用户名',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.send,
                cursorColor: Colors.black,
                cursorWidth: 2.0,
                cursorRadius: const Radius.circular(2.0),
                maxLines: 1,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: '密码',
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.send,
                cursorColor: Colors.black,
                cursorWidth: 2.0,
                cursorRadius: const Radius.circular(2.0),
                maxLines: 1,
                obscureText: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: _login,
                color: Colors.black,
                elevation: 1.0,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  "登录",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 12.0),
                  child: const Text(
                    "去注册",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: () {
                  //跳转到注册页
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterScreen();
                  }));
                },
              )
            ],
          ),
        ));
  }
}
