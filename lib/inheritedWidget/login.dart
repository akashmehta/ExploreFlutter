import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/inheritedWidget/login_page.dart';
import 'package:flutter_app/inheritedWidget/name_handler.dart';
import 'package:flutter_app/inheritedWidget/name_provider.dart';
import 'package:flutter_app/inheritedWidget/show_name.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: LoginPage(),
        ),
      ),
    );
  }
}