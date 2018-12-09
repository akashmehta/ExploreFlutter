import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_bloc.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_list.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_response.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_results.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

class OutputList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    RecipePuppyBloc recipePuppyBloc =
        InheritedBlocProvider.of<RecipePuppyBloc>(context);
    return StreamBuilder(
      stream: recipePuppyBloc.userInputStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Observable.just(snapshot.data)
            .flatMap((data) => Observable.fromFuture(fetchData(data)))
            .doOnListen(() => recipePuppyBloc.eventModelSink
                .add(EventModel(true, null, null)))
            .doOnData((list) => recipePuppyBloc.eventModelSink
                .add(EventModel(false, list, null)))
            .doOnError(() => recipePuppyBloc.eventModelSink
                .add(EventModel(false, null, ""))).listen(print);

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
//        if (outputList == null) {
//
//        } else if (outputList.isNotEmpty) {
//        } else {
//        }
//
//        return FutureBuilder(
//            future: fetchData(userInput),
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                List<RecipeResults> itemList = snapshot.data;
//                return RecipePuppyList(itemList);
//              } else if (snapshot.hasError) {
//                return _errorText(context, snapshot.error);
//              }
//              return CircularProgressIndicator(
//                backgroundColor: Colors.teal,
//                strokeWidth: 1,
//              );
//            });
      },
    );
  }

  Widget _errorText(BuildContext context, String message) {
    return Text(
      message,
      style: TextStyle(color: Colors.red, fontSize: 12),
    );
  }

  static Future<List<RecipeResults>> fetchData(String query) async {
    final response = await get("http://www.recipepuppy.com/api/?q=$query");
    if (response.statusCode == 200) {
      return RecipePuppyResponse.fromJson(JsonDecoder().convert(response.body))
          .results;
    } else {
      throw Exception(response.body);
    }
  }
}
