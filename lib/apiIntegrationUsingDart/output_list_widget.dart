import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_bloc.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_list.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';

class OutputList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    RecipePuppyBloc recipePuppyBloc =
        InheritedBlocProvider.of<RecipePuppyBloc>(context);
    return StreamBuilder(
      initialData: "",
      stream: recipePuppyBloc.userInputStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        recipePuppyBloc.fetchRecipeApiSearchResult(snapshot.data);

        return StreamBuilder<EventModel>(
          stream: recipePuppyBloc.eventModelStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              EventModel eventModel = snapshot.data;
              if (eventModel.isLoading) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.teal,
                  strokeWidth: 1,
                );
              } else if (eventModel.list != null) {
                return RecipePuppyList(eventModel.list);
              } else {
                return _errorText(context, snapshot.error);
              }
            } else {
              return _errorText(context, "");
            }
          },
        );
      },
    );
  }

  Widget _errorText(BuildContext context, String message) {
    return Text(
      message,
      style: TextStyle(color: Colors.red, fontSize: 12),
    );
  }
}
