import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/counterUsingBloc/counter_bloc.dart';

class CounterBlocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc counter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
                stream: counterBloc.outCounter,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(snapshot.data.toString());
                }),
            RaisedButton(
              onPressed: () => counterBloc.increment(),
              child: Icon(Icons.add),
            ),
            RaisedButton(
              onPressed: () => counterBloc.decrement(),
              child: Icon(Icons.skip_previous),
            )
          ],
        ),
      ),
    );
  }
}
