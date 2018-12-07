import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_results.dart';

const padding_16 = EdgeInsets.all(16);
const padding_10 = EdgeInsets.all(10);

class RecipePuppyList extends StatelessWidget {
  final List<RecipeResults> itemList;

  RecipePuppyList(this.itemList);

  @override
  Widget build(BuildContext context) {
    return Container(child: Expanded(child: _createListWidget(itemList)));
  }

  Widget _createListWidget(List<RecipeResults> recipeList) {
    ListView listView = ListView.builder(
        itemCount: recipeList.length,
        itemBuilder: (BuildContext context, int index) =>
            _createListRow(context, recipeList[index]));
    return listView;
  }

  Widget _createListRow(BuildContext context, RecipeResults item) {
    return Padding(
      padding: padding_16,
      child: Column(
        children: <Widget>[
          Padding(
            padding: padding_10,
            child: Text(
              item.title,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Padding(
            padding: padding_10,
            child: Text(item.ingredients,
                style: Theme.of(context).textTheme.subtitle),
          ),
        ],
      ),
    );
  }
}
