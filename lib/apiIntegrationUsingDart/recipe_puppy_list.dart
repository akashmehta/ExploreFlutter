import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_puppy_bloc.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_results.dart';
import 'package:flutter_app/common/inherited_bloc_provider.dart';

const padding_16 = EdgeInsets.all(16);
const padding_10 = EdgeInsets.all(10);

class RecipePuppyList extends StatelessWidget {
  final List<RecipeResults> itemList;

  RecipePuppyList(this.itemList);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(child: RecipeListView(recipeList: itemList)));
  }
}

class RecipeListView extends StatelessWidget {
  final List<RecipeResults> recipeList;

  const RecipeListView({Key key, this.recipeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recipeList.length,
        itemBuilder: (BuildContext context, int index) =>
            AnimateRecipeItem(item: recipeList[index], position: index,));
  }
}

class AnimateRecipeItem extends StatefulWidget {
  final RecipeResults item;
  final int position;

  AnimateRecipeItem({Key key, this.item, this.position}) : super(key: key);

  @override
  _AnimateRecipeItemState createState() => _AnimateRecipeItemState();
}

class _AnimateRecipeItemState extends State<AnimateRecipeItem>
    with TickerProviderStateMixin<AnimateRecipeItem> {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200), lowerBound: 0.1, upperBound: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    RecipePuppyBloc recipePuppyBloc =
        InheritedBlocProvider.of<RecipePuppyBloc>(context);
    return StreamBuilder<int>(
      initialData: 0,
      stream: recipePuppyBloc.animationStream.asBroadcastStream(),
      builder: (context, snapshot) {
        int currentPosition = snapshot.data;
        if (currentPosition == widget.position) {
          _controller.forward().then((f) => _controller.reverse());
        }
        return Container(
          child: FadeTransition(
            opacity: Tween(begin: .5, end: 1.0).animate(
                CurvedAnimation(curve: Curves.easeIn, parent: _controller)),
            child: RecipeItem(
              item: widget.item,
              position: widget.position,
            ),
          ),
        );
      },
    );
  }
}

class RecipeItem extends StatelessWidget {
  final RecipeResults item;
  final int position;

  RecipeItem({Key key, this.item, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecipePuppyBloc recipePuppyBloc =
        InheritedBlocProvider.of<RecipePuppyBloc>(context);
    return Material(
      child: InkWell(
        onTap: () => recipePuppyBloc.handleItemTap(position),
        child: Padding(
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
        ),
      ),
    );
  }
}
