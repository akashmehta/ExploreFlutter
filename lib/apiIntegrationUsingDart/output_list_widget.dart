import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_bloc.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_list.dart';
import 'package:flutter_app/common/circular_progress_indicator.dart';
import 'package:flutter_app/common/error_text_widget.dart';
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
                return ProgressIndicatorWidget();
              } else if (eventModel.list != null) {
                return RecipePuppyList(eventModel.list);
              } else {
                return ErrorTextWidget(snapshot.error);
              }
            } else {
              return ErrorTextWidget("");
            }
          },
        );
      },
    );
  }
}
