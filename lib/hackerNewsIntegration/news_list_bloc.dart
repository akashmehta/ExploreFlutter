import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/common/BaseBloc.dart';
import 'package:flutter_app/hackerNewsIntegration/news_ids_list.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

class NewsListBloc extends BaseBloc {
  StreamController<List<String>> _idListController = new StreamController();

  Sink<List<String>> get _idListSink => _idListController.sink;

  Stream<List<String>> get _idListStream => _idListController.stream;

  StreamController<List<NewsResponseItem>> _newsResponseController =
      new StreamController();

  Sink<List<NewsResponseItem>> get _newsResponseSink =>
      _newsResponseController.sink;

  Stream<List<NewsResponseItem>> get newsResponseStream =>
      _newsResponseController.stream;

  void fetchNewsItems(String newsType) {
    Observable.fromFuture(fetchNewsIds(newsType))
        .flatMap((List<int> idList) => _fetchIdApis(idList))

        .listen(null);
  }

  Observable<List<Observable<NewsResponseItem>>> _fetchIdApis(List<int> ids) {
    List<Observable<NewsResponseItem>> responseList = new List(ids.length);
    ids.forEach((id) {
      responseList.add(Observable.fromFuture(_fetchNewsItems(id)));
    });
    return Observable.just(responseList);
  }

  Future<NewsResponseItem> _fetchNewsItems (int id) async {
    final response = await get("https://hacker-news.firebaseio.com/v0/item/$id.json");
    if (response.statusCode == 200) {
      return NewsResponseItem.fromJson(JsonDecoder().convert(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<int>> fetchNewsIds(String newsType) async {
    final response =
        await get("https://hacker-news.firebaseio.com/v0/$newsType.json");
    if (response.statusCode == 200) {
      return NewsIdList.fromJson(JsonDecoder().convert(response.body)).ids;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  void dispose() {
    _idListController.close();
    _newsResponseController.close();
  }
}
