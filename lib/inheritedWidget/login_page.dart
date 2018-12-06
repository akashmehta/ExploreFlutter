import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/inheritedWidget/confirm_password_handler.dart';
import 'package:flutter_app/inheritedWidget/password_handler.dart';
import 'package:flutter_app/inheritedWidget/name_provider.dart';
import 'package:flutter_app/inheritedWidget/show_name.dart';

const labelPassword = "Password";
const labelConfirmPassword = "Confirm Password";
const labelSubmit = "Submit";
const _padding = EdgeInsets.all(16);

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = "";

  String confirmPassword = "";

  void setPassword(String password) {
    this.password = password;
  }

  void setConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
  }

  var passwordHandler = new PasswordHandler("");
  var confirmPasswordHandler = new ConfirmPasswordHandler("");

  @override
  Widget build(BuildContext context) {
    return NameProvider(
      passwordHandler: passwordHandler,
      confirmPasswordHandler: confirmPasswordHandler,
      child: Column(
        children: <Widget>[
          Padding(
              padding: _padding,
              child: TextField(
                style: Theme.of(context).textTheme.display1,
                decoration: InputDecoration(
                    labelText: labelPassword,
                    labelStyle: Theme.of(context).textTheme.display1,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2))),
                onChanged: setPassword,
                obscureText: true,
              )),
          Padding(
            padding: _padding,
            child: TextField(
              style: Theme.of(context).textTheme.display1,
              decoration: InputDecoration(
                  labelText: labelConfirmPassword,
                  labelStyle: Theme.of(context).textTheme.display1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2))),
              onChanged: setConfirmPassword,
              obscureText: true,
            ),
          ),
          RaisedButton(
              child: Text(labelSubmit),
              onPressed: () {
                setState(() {
                  passwordHandler.setName(password);
                  confirmPasswordHandler.setName(confirmPassword);
                });
              }),
          ShowName()
        ],
      ),
    );
  }
}
