import 'dart:async';

import 'package:flutter_app/apiIntegrationUsingDart/output_list_widget.dart';
import 'package:flutter_app/apiIntegrationUsingDart/recipe_results.dart';
import 'package:flutter_app/common/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

class RecipePuppyBloc extends BaseBloc {
  StreamController<String> _userInputController =
      new StreamController<String>();

  Sink<String> get _userInputSink => _userInputController.sink;

  Stream<String> get userInputStream => _userInputController.stream;

  Observable<List<RecipeResults>> get recipeResult =>
      new Observable(userInputStream).flatMap((userInput) =>
          Observable.fromFuture(OutputList.fetchData(userInput)));

  StreamController<EventModel> _eventController =
      new StreamController<EventModel>();

  Sink<EventModel> get eventModelSink => _eventController.sink;

  Stream<EventModel> get eventModelStream => _eventController.stream;

  RecipePuppyBloc();

  void searchItems(String name) {
    _userInputSink.add(name);
  }

  @override
  void dispose() {
    _userInputController.close();
    _eventController.close();
  }
}

class EventModel {
  final bool isLoading;
  final List<RecipeResults> list;
  final String error;

  EventModel(this.isLoading, this.list, this.error);
}
