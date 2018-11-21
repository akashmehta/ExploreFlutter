import 'package:flutter/material.dart';
import 'package:flutter_app/listWidgets/ListComponent.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Center(
          child: ListComponent(),
        )
      ),
    );
  }

}