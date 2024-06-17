import 'package:flutter/material.dart';
import 'package:ws_wanandroid_app_flutter/util/toast_util.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _register() {
    //注册校验逻辑
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    if (username.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty) {
      //发起注册请求
      ToastUtil.showToast(
          msg: "当前注册的用户名：$username → 密码：$password 确认密码：$confirmPassword");
    } else {
      ToastUtil.showToast(msg: "用户名或密码不能为空");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('注册页', style: TextStyle(color: Colors.white)),
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
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: '确认密码',
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
                onPressed: _register,
                color: Colors.black,
                elevation: 1.0,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  "注册",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
