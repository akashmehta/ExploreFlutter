import 'dart:async';

import 'package:flutter_app/common/BaseBloc.dart';

class RecipePuppyBloc extends BaseBloc {

  StreamController<String> _userInputController = new StreamController<String>();
  Sink<String> get _userInputSink => _userInputController.sink;
  Stream<String> get userInputStream => _userInputController.stream;

  RecipePuppyBloc();

  void searchItems(String name) {
    _userInputSink.add(name);
  }

  @override
  void dispose() {
    _userInputController.close();
  }
}