import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ws_wanandroid_app_flutter/util/toast_util.dart';

import '../http/dio_client.dart';
import '../http/exception.dart';
import '../model/base_response.dart';
import '../model/user_info.dart';
import '../provider/login_status.dart';
import '../util/dialog_util.dart';
import '../util/shared_preferences_util.dart';

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
      //弹出登录对话框
      showLoadingDialog(context);
      // 在发起登录请求
      DioClient().post("/user/register", params: {
        "username": username,
        "password": password,
        "repassword": confirmPassword
      }).then((value) async {
        // 关闭Loading对话框
        Navigator.pop(context);
        var resp = DataResponse<UserInfo>.fromJson(
            value.data, (json) => UserInfo.fromJson(json));
        SharedPreferencesUtil.getInstance()
            .then((value) => value.putString("user_info", json.encode(resp)));
        ToastUtil.show(msg: "注册成功");
        Provider.of<LoginStatus>(context, listen: false)
            .updateLoginStatus(true);
        // 获取响应头里的Set-Cookie，设置到请求头中，并通过sp持久化到本地
        List<String>? cookies = value.headers['Set-Cookie'];
        if (cookies != null) {
          DioClient().setCookies(cookies);
          SharedPreferencesUtil.getInstance()
              .then((value) => value.putStringList("cookies", cookies));
          //关闭注册页面
          Navigator.pop(context);
        }
      }).catchError((e) {
        Navigator.pop(context);
        if (e is OtherException) {
          ToastUtil.show(msg: "注册失败：${e.message}");
        } else {
          ToastUtil.show(msg: "注册失败：$e");
        }
      });
    } else {
      Fluttertoast.showToast(msg: "用户名或密码不能为空");
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
