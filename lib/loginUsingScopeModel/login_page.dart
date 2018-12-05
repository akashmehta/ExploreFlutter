import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loginUsingScopeModel/login_model.dart';
import 'package:scoped_model/scoped_model.dart';

const _padding = EdgeInsets.all(16);

const labelUserName = "Email";
const labelPassword = "Password";
const labelSubmit = "Submit";

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Scope"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: _padding,
            child: Container(
              child: _loginComponent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginComponent(BuildContext context) => Column(
        children: <Widget>[
          ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
            return TextField(
              style: Theme.of(context).textTheme.display1,
              decoration: InputDecoration(
                  labelText: labelUserName,
                  labelStyle: Theme.of(context).textTheme.display1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2))),
              keyboardType: TextInputType.emailAddress,
              onChanged: model.setUserName,
            );
          }),
          ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
            return _errorText(model.userNameErr);
          }),
          ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
            return TextField(
              style: Theme.of(context).textTheme.display1,
              decoration: InputDecoration(
                  labelText: labelPassword,
                  labelStyle: Theme.of(context).textTheme.display1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2))),
              obscureText: true,
              onChanged: model.setPassword,
            );
          }),
          ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
            return _errorText(model.passwordErr);
          }),
          ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
            return RaisedButton(
                child: Text(labelSubmit),
                onPressed: () {
                  model.handleSubmit();
                });
          }),
        ],
      );

  Widget _errorText(String message) => Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          _checkNull(message),
          style: TextStyle(color: Colors.red),
        ),
      );

  Widget _message(String message) => Padding(
        padding: EdgeInsets.all(10),
        child: Text(_checkNull(message)),
      );

  String _checkNull(String message) {
    if (message != null) {
      return message;
    } else {
      return "";
    }
  }
}
