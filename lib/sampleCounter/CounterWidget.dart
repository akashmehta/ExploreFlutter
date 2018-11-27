import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterWidget();
}

class _CounterWidget extends State<CounterWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          heightFactor: 2.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(_counter.toString()),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: MaterialButton(
                    splashColor: Colors.teal[50],
                    onPressed: _updateCounter,
                    child: Text("Increament"),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void _updateCounter() {
    setState(() {
      _counter++;
    });
  }
}
