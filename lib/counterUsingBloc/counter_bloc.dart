import 'dart:async';

import 'package:flutter_app/common/BaseBloc.dart';

class CounterBloc extends BaseBloc {
  StreamController<int> _counterController = StreamController<int>();

  Sink<int> get _inAdd => _counterController.sink;

  Stream<int> get outCounter => _counterController.stream;

  int _counter = 0;

  CounterBloc() {
    this._counter = 0;
  }

  void increment() {
    _inAdd.add(++_counter);
  }

  void decrement() {
    _inAdd.add(--_counter);
  }

  @override
  void dispose() {
    _counterController.close();
  }
}
