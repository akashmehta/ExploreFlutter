import 'package:flutter/material.dart';
import 'package:flutter_app/futureWidget/RemoteItem.dart';
import 'package:flutter_app/streamAndSink/CounterWidget.dart';
import 'package:flutter_app/unitApiIntegration/UnitWidget.dart';
import 'package:flutter_app/unitConvertor/UnitList.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterWidget(),
    );
  }

}