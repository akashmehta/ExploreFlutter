import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/counterUsingBloc/counter_bloc.dart';
import 'package:flutter_app/counterUsingBloc/counter_bloc_widget.dart';
import 'package:flutter_app/futureWidget/RemoteItem.dart';
import 'package:flutter_app/streamAndSink/CounterWidget.dart';
import 'package:flutter_app/unitApiIntegration/UnitWidget.dart';
import 'package:flutter_app/unitConvertor/UnitList.dart';
import 'package:flutter_app/userLoginPage/login_bloc.dart';
import 'package:flutter_app/loginUsingScopeModel/login_page.dart';
import 'package:flutter_app/userLoginPage/login_page_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
