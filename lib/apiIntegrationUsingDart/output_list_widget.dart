import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_bloc.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_list.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_response.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_results.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';
import 'package:http/http.dart';

class OutputList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipePuppyBloc recipePuppyBloc =
        InheritedBlocProvider.of<RecipePuppyBloc>(context);
    return StreamBuilder(
      stream: recipePuppyBloc.userInputStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        String userInput = snapshot.data;
        return FutureBuilder(
            future: fetchData(userInput),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<RecipeResults> itemList = snapshot.data;
                return RecipePuppyList(itemList);
              } else if (snapshot.hasError) {
                return _errorText(context, snapshot.error);
              }
              return CircularProgressIndicator(
                backgroundColor: Colors.teal,
                strokeWidth: 1,
              );
            });
      },
    );
  }

  Widget _errorText(BuildContext context, String message) {
    return Text(
      message,
      style: TextStyle(color: Colors.red, fontSize: 12),
    );
  }

  Future<List<RecipeResults>> fetchData(String query) async {
    final response = await get("http://www.recipepuppy.com/api/?q=$query");
    if (response.statusCode == 200) {
      return RecipePuppyResponse.fromJson(JsonDecoder().convert(response.body))
          .results;
    } else {
      throw Exception(response.body);
    }
  }
}
