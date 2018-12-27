import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/userLoginPage/login_bloc.dart';
import 'package:flutter_app/userLoginPage/login_page_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          bloc: LoginBloc(),
          child: LoginPageWidget(),
        ));
  }
}
