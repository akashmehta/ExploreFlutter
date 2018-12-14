import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/common/BaseBloc.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

class NewsListBloc extends BaseBloc {
  StreamController<EventModel> _eventController = new StreamController();

  Sink<EventModel> get _eventSink => _eventController.sink;

  Stream<EventModel> get eventStream => _eventController.stream;

  StreamController<List<NewsResponseItem>> _itemListController =
      new StreamController();

  Sink<List<NewsResponseItem>> get _itemListSink => _itemListController.sink;

  Stream<List<NewsResponseItem>> get itemListStream =>
      _itemListController.stream;


  StreamController<List<int>> _intCountController =
      new StreamController();
  Sink<List<int>> get _intCountSink => _intCountController.sink;
  Stream<List<int>> get intCountStream => _intCountController.stream;

  StreamController<List<int>> _intEventController =
      new StreamController();
  Sink<List<int>> get _intEventSink => _intEventController.sink;
  Stream<List<int>> get intEventStream => _intEventController.stream;


  void updateItemList(List<int> preList,
      List<int> data, bool updateList) {
    if (updateList) {
      print("==================== ==================== UPDATE LIST");
      preList.addAll(data);
    }
    print("==================== ==================== SHOW LIST VIEW");
    _intCountSink.add(preList);
  }

  void fetchNewsItems(String newsType) {
    AsObservableFuture future = Observable.fromFuture(fetchNewsIds(newsType))
        .flatMapIterable((id) => Observable.just(id))
        .skip(0)
        .take(10)
        .flatMap((id) => Observable.fromFuture(_fetchNewsItems(id)))
        .toList();
    Observable.fromFuture(future).doOnListen(() {
      _eventSink.add(EventModel(true, null, null));
    }).doOnError((error, stacktrace) {
      _eventSink.add(EventModel(false, null, error.toString()));
    }).listen((itemList) {
      _eventSink.add(EventModel(false, itemList, null));
    });
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
    print(
        "https://hacker-news.firebaseio.com/v0/${newsType.toLowerCase() + "stories"}.json");
    final response = await get(
        "https://hacker-news.firebaseio.com/v0/${newsType.toLowerCase() + "stories"}.json");
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
    _itemListController.close();
    _intCountController.close();
    _intEventController.close();
  }
}

class EventModel {
  final bool progress;
  final List<NewsResponseItem> response;
  final String error;

  EventModel(this.progress, this.response, this.error);
}

class IntEventModel {
  final bool progress;
  final List<int> response;
  final String error;

  IntEventModel(this.progress, this.response, this.error);
}