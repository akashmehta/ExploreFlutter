import 'package:flutter/cupertino.dart';
import 'package:flutter_app/inheritedModel/confirm_password_handler.dart';
import 'package:flutter_app/inheritedModel/password_handler.dart';

class NameProvider<String> extends InheritedModel<String> {
  final PasswordHandler passwordHandler;
  final ConfirmPasswordHandler confirmPasswordHandler;
  final Widget child;

  NameProvider({this.passwordHandler, this.confirmPasswordHandler, this.child})
      : super(child: child);

  static NameProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(NameProvider);

  @override
  bool updateShouldNotify(NameProvider oldWidget) {
    return (oldWidget.passwordHandler != passwordHandler) &&
        (oldWidget.confirmPasswordHandler != confirmPasswordHandler);
  }

  @override
  bool updateShouldNotifyDependent(
      NameProvider<String> oldWidget, Set<String> dependencies) {
    return dependencies.contains("password") &&
        (passwordHandler.password != oldWidget.passwordHandler.password);
  }
}
