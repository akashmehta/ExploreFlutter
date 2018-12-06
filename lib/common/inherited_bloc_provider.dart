import 'package:flutter/cupertino.dart';
import 'package:flutter_app/inheritedModelBloc/login_bloc.dart';

class InheritedBlocProvider extends InheritedWidget {
  final LoginBloc bloc = new LoginBloc();

  InheritedBlocProvider({Key key, Widget child})
      : super(key: key, child: child);

  static LoginBloc of(BuildContext context) {
    InheritedBlocProvider inheritedBlocProvider =
        context.inheritFromWidgetOfExactType(InheritedBlocProvider);
    return inheritedBlocProvider.bloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
