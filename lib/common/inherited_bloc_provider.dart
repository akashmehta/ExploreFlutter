import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/BaseBloc.dart';

class InheritedBlocProvider<T extends BaseBloc> extends InheritedWidget {
  T bloc;

  void createInstance(T t) {
    this.bloc = t;
  }

  InheritedBlocProvider({Key key, Widget child})
      : super(key: key, child: child);

  static T of<T extends BaseBloc>(BuildContext context) {
    InheritedBlocProvider inheritedBlocProvider =
        context.inheritFromWidgetOfExactType(InheritedBlocProvider);
    return inheritedBlocProvider.bloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
