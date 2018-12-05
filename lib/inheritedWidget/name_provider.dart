import 'package:flutter/cupertino.dart';
import 'package:flutter_app/inheritedWidget/name_handler.dart';

class NameProvider extends InheritedWidget {
  final NameHandler nameHandler;

  final Widget child;

  NameProvider({this.nameHandler, this.child}) : super(child: child);

  static NameProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(NameProvider);

  @override
  bool updateShouldNotify(NameProvider oldWidget) {
    return nameHandler.name != oldWidget.nameHandler.name;
  }
}
