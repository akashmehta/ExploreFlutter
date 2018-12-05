import 'package:scoped_model/scoped_model.dart';

class LoginModel extends Model {
  String userName = "";
  String password = "";

  String userNameErr = "";
  String passwordErr = "";

  void _setUserNameError(String message) {
    this.userNameErr = message;
    notifyListeners();
  }

  void _setPasswordError(String message) {
    this.passwordErr = message;
    notifyListeners();
  }

  void setUserName(String username) {
    this.userName = username;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void handleSubmit() {
    if (userName != "" && password != "") {

    } else {
      if (userName == "") {
        _setUserNameError("Email should not be empty");
      } else {
        _setUserNameError("");
      }
      if (password == "") {
        _setPasswordError("Password should not be empty");
      } else {
        _setPasswordError("");
      }
    }
  }
}
