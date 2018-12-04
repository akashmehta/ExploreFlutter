import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/userLoginPage/login_bloc.dart';

const labelUserName = "Email";
const labelPassword = "Password";
const labelSubmit = "Submit";

class LoginPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Login page"),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: _loginComponent(context, loginBloc),
          ),
        ));
  }

  String _checkNull(String message) {
    if (message != null) {
      return message;
    } else {
      return "";
    }
  }

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

  Widget _loginComponent(BuildContext context, LoginBloc loginBloc) => Column(
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
                labelText: labelUserName,
                labelStyle: Theme.of(context).textTheme.display1,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(2))),
            keyboardType: TextInputType.emailAddress,
            onChanged: loginBloc.setUserName,
          ),
          StreamBuilder(
              stream: loginBloc.outUserName,
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  _errorText(snapshot.data)),
          TextField(
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
                labelText: labelPassword,
                labelStyle: Theme.of(context).textTheme.display1,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(2))),
            obscureText: true,
            onChanged: loginBloc.setPassword,
          ),
          StreamBuilder(
              stream: loginBloc.outPassword,
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  _errorText(snapshot.data)),
          RaisedButton(
              child: Text(labelSubmit),
              onPressed: () {
                loginBloc.handleSubmit(null);
              }),
          StreamBuilder(
            stream: loginBloc.outSuccess,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                _message(snapshot.data),
          )
        ],
      );
}
