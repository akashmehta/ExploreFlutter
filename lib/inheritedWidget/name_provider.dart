import 'package:flutter/cupertino.dart';
import 'package:flutter_app/inheritedWidget/confirm_password_handler.dart';
import 'package:flutter_app/inheritedWidget/password_handler.dart';

class NameProvider extends InheritedWidget {
  final PasswordHandler passwordHandler;
  final ConfirmPasswordHandler confirmPasswordHandler;
  final Widget child;

  NameProvider({this.passwordHandler, this.confirmPasswordHandler, this.child}) : super(child: child);

  static NameProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(NameProvider);

  @override
  bool updateShouldNotify(NameProvider oldWidget) {
    return (passwordHandler.name != oldWidget.passwordHandler.name) ||
        (confirmPasswordHandler.name != oldWidget.confirmPasswordHandler.name);
  }
}
