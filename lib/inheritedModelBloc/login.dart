import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';
import 'package:flutter_app/inheritedModelBloc/login_page.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: InheritedBlocProvider(
        child: LoginPage(),
      ),
    );
  }
}
