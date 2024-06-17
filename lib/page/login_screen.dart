import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('登录', style: TextStyle(color: Colors.white))),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              textInputAction: TextInputAction.send,
              cursorColor: Colors.black,
              cursorWidth: 2.0,
              cursorRadius: Radius.circular(2.0),
              maxLines: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              textInputAction: TextInputAction.send,
              cursorColor: Colors.black,
              cursorWidth: 2.0,
              cursorRadius: Radius.circular(2.0),
              maxLines: 1,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
              child: MaterialButton(
                onPressed: _onLoginButtonPressed,
                color: Colors.black,
                textColor: Colors.white,
                elevation: 1.0,
                child: Text("登录"),
              ))
        ],
      ),
    );
  }
}

void _onLoginButtonPressed() {
  print("点击登录");
}
