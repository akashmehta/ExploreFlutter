import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_bloc.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';

const labelInput = "Recipe";

class UserInputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipePuppyBloc bloc = InheritedBlocProvider.of<RecipePuppyBloc>(context);
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          style: Theme.of(context).textTheme.display1,
          decoration: InputDecoration(
              labelText: labelInput,
              labelStyle: Theme.of(context).textTheme.display1,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(2))),
          onChanged: bloc.searchItems,
        ),
      ),
    );
  }
}