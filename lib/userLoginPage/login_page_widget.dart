import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  Widget _loginComponent(BuildContext context, LoginBloc loginBloc) =>
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              style: Theme.of(context).textTheme.display1,
              decoration: InputDecoration(
                  labelText: labelUserName,
                  labelStyle: Theme.of(context).textTheme.display1,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2))),
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2))),
              obscureText: true,
              onChanged: loginBloc.setPassword,
            ),
            StreamBuilder(
                stream: loginBloc.outPassword,
                builder: (BuildContext context, AsyncSnapshot snapshot) =>
                    _errorText(snapshot.data)),
            LoginScreen(),
            StreamBuilder(
              stream: loginBloc.outSuccess,
              builder: (BuildContext context, AsyncSnapshot snapshot) =>
                  _message(snapshot.data),
            )
          ],
        ),
      );
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin<LoginScreen> {
  AnimationController _controller;
  Animation _buttonSqueezeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: new Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    _buttonSqueezeAnimation = new Tween(begin: 320.0, end: 70.0).animate(
        new CurvedAnimation(curve: Interval(0.0, 0.250), parent: _controller));
    return Container(
      child: InkWell(
        onTap: () {
          _playAnimation();
        },
        child: Container(
          width: _buttonSqueezeAnimation.value,
          height: 60.0,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 133, 71, 1),
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: _buttonSqueezeAnimation.value > 75.0
              ? new Text(
                  "Sign In",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                )
              : new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
        ),
      ),
    );
  }

  Future<Null> _playAnimation() async {
    print("On tap called!");

    try {
      print("Controller animated !");
      await _controller.forward();
      await _controller.reverse();
    } on TickerCanceled {
      print("Something wrong happened!");
    }
  }
}
