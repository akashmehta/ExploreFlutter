import 'package:flutter/material.dart';

class CustomWidgetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Custom row",
      home: Scaffold(
        body: Container(
            child: InkWell(
                highlightColor: Colors.amberAccent,
                splashColor: Colors.greenAccent,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(Icons.cake),
                      ),
                      Center(
                        child: Text(
                          "Hello",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}
