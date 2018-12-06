import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';
import 'package:flutter_app/inheritedModelBloc/login_bloc.dart';

class ShowName extends StatelessWidget {
  ShowName();

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = InheritedBlocProvider.of(context);
    return StreamBuilder(
        initialData: "",
        stream: loginBloc.messageStream,
        builder: (BuildContext context, AsyncSnapshot<String> data) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(data.data),
            ),
          );
        });
  }
}
