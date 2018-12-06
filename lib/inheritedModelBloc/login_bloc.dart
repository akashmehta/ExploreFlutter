import 'dart:async';

import 'package:flutter_app/common/BaseBloc.dart';

class LoginBloc extends BaseBloc {
  StreamController<String> _handleSubmitController =
  new StreamController<String>();

  StreamController<String> _messageController = new StreamController<String>();

  Sink<String> get _messageSink => _messageController.sink;

  Stream<String> get messageStream => _messageController.stream;

  String _password;
  String _confirmPassword;

  void setPassword(String password) => this._password = password;

  void setConfirmPassword(String confirmPassword) =>
      this._confirmPassword = confirmPassword;


  LoginBloc() {
    _handleSubmitController.stream.listen(handleSubmit);
  }

  void handleSubmit(String data) {
    String result;
    if (_password == _confirmPassword) {
      result = "Matched";
    } else {
      result = "Not Matched";
    }
    _messageSink.add(result);
  }

  @override
  void dispose() {
    _handleSubmitController.close();
    _messageController.close();
  }
}
