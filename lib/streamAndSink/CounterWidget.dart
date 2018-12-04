import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _padding = EdgeInsets.all(16.0);

class CounterWidget extends StatelessWidget {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    StreamController streamController = StreamController();
    return Scaffold(
        appBar: AppBar(
          title: Text("Stream sink counter"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: _padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder(
                    stream: streamController.stream,
                    builder: (context, asyncSnapshot) {
                      return Text(asyncSnapshot.data.toString());
                    }),
                Padding(
                  padding: _padding,
                  child: RaisedButton(
                    onPressed: () {
                      streamController.sink.add(++_counter);
                    },
                    child: Icon(Icons.add),
                  ),
                ),
                Padding(
                  padding: _padding,
                  child: RaisedButton(
                    onPressed: () {
                      streamController.sink.add(--_counter);
                    },
                    child: Icon(Icons.redo),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
