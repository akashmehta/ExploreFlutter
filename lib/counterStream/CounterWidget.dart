import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

const _padding = EdgeInsets.all(16.0);

class CounterWidget extends StatelessWidget {
  var _counter = 0;

  var counterSubject = BehaviorSubject<int>();
  @override
  Widget build(BuildContext context) {
    StreamBuilder builder = new StreamBuilder(stream: counterSubject,
    builder: (context, asyncSnapShot) {
      return Padding(
        padding: _padding,
        child: Text("count : ${asyncSnapShot.data.toString()}"),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Center(
              child: builder,
            ),
            Center(
              child: Padding(
                padding: _padding,
                child: RaisedButton(
                  onPressed: _onUpTap,
                  child: Text("Up"),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: _padding,
                child: RaisedButton(
                  onPressed: _onDownTap,
                  child: Text("down"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onUpTap() {
    counterSubject.add(_counter++);
  }

  void _onDownTap() {
    counterSubject.add(_counter--);
  }
}
