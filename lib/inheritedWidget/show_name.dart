import 'package:flutter/cupertino.dart';
import 'package:flutter_app/inheritedWidget/confirm_password_handler.dart';
import 'package:flutter_app/inheritedWidget/password_handler.dart';
import 'package:flutter_app/inheritedWidget/name_provider.dart';

class ShowName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PasswordHandler passwordHandler = NameProvider.of(context).passwordHandler;
    ConfirmPasswordHandler confirmPasswordHandler = NameProvider.of(context).confirmPasswordHandler;
    String matched = "";
    if (passwordHandler.name == confirmPasswordHandler.name) {
      matched = "matched";
    } else {
      matched = "not matched";
    }
    return Center (
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(matched),
      ),
    );
  }

}