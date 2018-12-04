import 'package:flutter/cupertino.dart';

abstract class BaseBloc {
  void dispose();
}

class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  final T bloc;
  final Widget child;

  const BlocProvider({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  @override
  _BaseBlocProvider createState() => _BaseBlocProvider();

  static T of<T extends BaseBloc>(BuildContext context) {
    final type = typeOf<BlocProvider<T>>();
    BlocProvider<T> blocProvider = context.ancestorWidgetOfExactType(type);
    return blocProvider.bloc;
  }

  static Type typeOf<T>() => T;
}

class _BaseBlocProvider extends State<BlocProvider> {
  @override
  void dispose() {
    super.dispose();
    widget.bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
