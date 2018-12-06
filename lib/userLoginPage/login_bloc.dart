import 'dart:async';

import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/common/BaseBloc.dart';

class LoginBloc extends BaseBloc {
  String _userName = "";
  String _password = "";

  StreamController<String> _userNameController = StreamController<String>();

  Sink<String> get _inUserName => _userNameController.sink;

  Stream<String> get outUserName => _userNameController.stream;

  StreamController<String> _passwordController = StreamController<String>();

  Sink<String> get _inPassword => _passwordController.sink;

  Stream<String> get outPassword => _passwordController.stream;

  StreamController<String> _successMessage = StreamController<String>();

  Sink<String> get _inSuccess => _successMessage.sink;

  Stream<String> get outSuccess => _successMessage.stream;

  StreamController<String> _submitController = StreamController<String>();

  Sink<String> get submitSink => _submitController.sink;

  LogicBloc() {
    _submitController.stream.listen(handleSubmit);
  }

  void handleSubmit(data) {
    if (_userName == "") {
      _inUserName.add("Email id must not be null");
    } else {
      _inUserName.add("");
    }

    if (_password == "") {
      _inPassword.add("Password must not be null");
    } else {
      _inPassword.add("");
    }

    if (_userName != "" && _password != "") {
      _inSuccess.add("You can login now!");
    }
  }

  void setUserName(String value) {
    this._userName = value;
  }

  void setPassword(String value) {
    this._password = value;
  }

  @override
  void dispose() {
    _successMessage.close();
    _submitController.close();
    _userNameController.close();
    _passwordController.close();
  }
}
