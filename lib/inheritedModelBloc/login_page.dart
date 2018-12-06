import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';
import 'package:flutter_app/inheritedModelBloc/login_bloc.dart';
import 'package:flutter_app/inheritedModelBloc/show_name.dart';

const labelPassword = "Password";
const labelConfirmPassword = "Confirm Password";
const labelSubmit = "Submit";
const _padding = EdgeInsets.all(16);

class LoginPage extends StatelessWidget {
  LoginPage();

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = InheritedBlocProvider.of(context);
    return Column(
      children: <Widget>[
        Padding(
            padding: _padding,
            child: TextField(
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
              decoration: InputDecoration(
                  labelText: labelPassword,
                  labelStyle: Theme
                      .of(context)
                      .textTheme
                      .display1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2))),
              onChanged: loginBloc.setPassword,
              obscureText: true,
            )),
        Padding(
          padding: _padding,
          child: TextField(
            style: Theme
                .of(context)
                .textTheme
                .display1,
            decoration: InputDecoration(
                labelText: labelConfirmPassword,
                labelStyle: Theme
                    .of(context)
                    .textTheme
                    .display1,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2))),
            onChanged: loginBloc.setConfirmPassword,
            obscureText: true,
          ),
        ),
        RaisedButton(
            child: Text(labelSubmit),
            onPressed: () {
              loginBloc.handleSubmit(null);
            }),
        ShowName()
      ],
    );
  }
}
