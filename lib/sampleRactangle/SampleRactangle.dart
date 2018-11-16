import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
        ),
        body: SampleRectangle(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SampleRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.greenAccent,
        height: 400.0,
        width: 300.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Hi",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}