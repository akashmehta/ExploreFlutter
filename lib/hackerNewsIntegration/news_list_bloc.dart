import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/common/BaseBloc.dart';
import 'package:flutter_app/hackerNewsIntegration/news_ids_list.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

class NewsListBloc extends BaseBloc {

  StreamController<EventModel> _eventController = new StreamController();
  Sink<EventModel> get _eventSink  => _eventController.sink;
  Stream<EventModel> get eventStream => _eventController.stream;

  void fetchNewsItems(String newsType) {
    AsObservableFuture future = Observable.fromFuture(fetchNewsIds(newsType))
        .flatMapIterable((id) => Observable.just(id))
        .skip(0)
        .take(10)
        .flatMap((int id) => Observable.fromFuture(_fetchNewsItems(id)))
        .toList();
    Observable.fromFuture(future).listen(print);
  }

  Future<NewsResponseItem> _fetchNewsItems(int id) async {
    final response =
        await get("https://hacker-news.firebaseio.com/v0/item/$id.json");
    if (response.statusCode == 200) {
      return NewsResponseItem.fromJson(JsonDecoder().convert(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<int>> fetchNewsIds(String newsType) async {
    print("https://hacker-news.firebaseio.com/v0/$newsType.json");
    final response =
        await get("https://hacker-news.firebaseio.com/v0/$newsType.json");
    if (response.statusCode == 200) {
      List<int> idList = List();
      List<dynamic> responseList = JsonDecoder().convert(response.body);
      for (var value in responseList) {
        if (value is int) {
          idList.add(value);
        }
      }
      return idList;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  void dispose() {
    _eventController.close();
  }
}

class EventModel {
  final bool progress;
  final List<NewsResponseItem> response;
  final String error;

  EventModel(this.progress, this.response, this.error);
}
