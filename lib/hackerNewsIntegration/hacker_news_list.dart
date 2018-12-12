import 'package:flutter/material.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_item.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';

class HackerNewsListWidget extends StatelessWidget {
  final List<NewsResponseItem> itemList;

  HackerNewsListWidget(this.itemList) : assert(itemList != null);

  @override
  Widget build(BuildContext context) {
    NewsListBloc().fetchNewsItems("newstories");
    return Container(child: _createListView(itemList));
  }

  Widget _createListView(List<NewsResponseItem> itemList) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) => _createListRow(index),
    );
  }

  Widget _createListRow(int index) {
    return NewsListItem(itemList[index]);
  }
}
