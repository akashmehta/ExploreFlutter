import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/BaseBloc.dart';

class BlocProvider<T extends BaseBloc> extends StatelessWidget {
  final T bloc;
  final Widget child;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  static T of<T extends BaseBloc>(BuildContext context) {
    final type = typeOf<BlocProvider<T>>();
    BlocProvider<T> blocProvider = context.ancestorWidgetOfExactType(type);
    return blocProvider.bloc;
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }

  static Type typeOf<T>() => T;
}
