import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterWidget();
}

class _CounterWidget extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        heightFactor: 2.0,
      ),
    );
  }
}