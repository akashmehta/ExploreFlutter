import 'package:flutter/material.dart';
import 'CustomWidgetRow.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Center(
          child: CustomWidgetRow(),
        )
      ),
    );
  }

}