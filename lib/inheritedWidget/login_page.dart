import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/inheritedWidget/name_handler.dart';
import 'package:flutter_app/inheritedWidget/name_provider.dart';
import 'package:flutter_app/inheritedWidget/show_name.dart';

const labelUserName = "Email";
const labelSubmit = "Submit";

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";

  void setName(String userName) {
    this.userName = userName;
  }
  var nameHandler = new NameHandler("");

  @override
  Widget build(BuildContext context) {
    return NameProvider(
      nameHandler: nameHandler,
      child: Column(
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.display1,
            decoration: InputDecoration(
                labelText: labelUserName,
                labelStyle: Theme.of(context).textTheme.display1,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(2))),
            keyboardType: TextInputType.emailAddress,
            onChanged: setName,
          ),
          RaisedButton(
              child: Text(labelSubmit),
              onPressed: () {
                setState(() {
                  nameHandler.setName(userName);
                });
              }),
          ShowName()
        ],
      ),
    );
  }
}
