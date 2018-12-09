import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiIntegrationUsingDart/output_list_widget.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_bloc.dart';
import 'package:flutter_app/apiIntegrationUsingDart/user_input_widget.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';

class RecipePuppyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InheritedBlocProvider provider = InheritedBlocProvider(
      child: Container(
        child: Column(
          children: <Widget>[
            UserInputWidget(),
            OutputList(),
          ],
        ),
      ),
    );
    provider.createInstance(RecipePuppyBloc());
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipe puppy list"),
          centerTitle: true,
        ),
        body: provider);
  }
}
