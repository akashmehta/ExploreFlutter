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

  void fetchRecipeApiSearchResult(String query) {
    Observable.just(query)
        .flatMap((data) => Observable.fromFuture(fetchData(data)))
        .doOnListen(() => eventModelSink.add(EventModel(true, null, null)))
        .doOnData((list) => eventModelSink.add(EventModel(false, list, null)))
        .doOnError(() => eventModelSink.add(EventModel(false, null, "")))
        .listen(print);
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

class EventModel {
  final bool isLoading;
  final List<RecipeResults> list;
  final String error;

  EventModel(this.isLoading, this.list, this.error);
}
