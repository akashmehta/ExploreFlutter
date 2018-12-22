import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/common/circular_progress_indicator.dart';
import 'package:flutter_app/common/error_text_widget.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_item.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'hacker_news_list.g.dart';

NewsListBloc newsListBloc;
String contentType;

class HackerNewsListWidget extends StatefulWidget {
  HackerNewsListWidget(String type) :
        assert(type != null){
    contentType = type;
  }

  @override
  _HackerNewsListWidgetState createState() => _HackerNewsListWidgetState();
}

class _HackerNewsListWidgetState extends State<HackerNewsListWidget>
    with AutomaticKeepAliveClientMixin<HackerNewsListWidget> {

  List<NewsResponseItem> itemList = List<NewsResponseItem>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    newsListBloc = BlocProvider.of<NewsListBloc>(context);
    newsListBloc.fetchNewsItems(contentType);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: CreateList(newsListBloc, itemList, isLoading, contentType));
  }

  @override
  bool get wantKeepAlive => true;
}

@widget
Widget createList(BuildContext context, NewsListBloc newsListBloc, List<NewsResponseItem> itemList, bool isLoading, String type) {
  return StreamBuilder(
      initialData: EventModel(true, null, null),
      stream: newsListBloc.eventStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return GetPage(snapshot.data, itemList, isLoading, type);
      });
}

@widget
Widget getPage(BuildContext context, EventModel model, List<NewsResponseItem> itemList, bool isLoading, String type) {
  isLoading = false;
  if (model.progress) {
    if (itemList.isEmpty) {
      return ProgressIndicatorWidget();
    } else {
      return CreateListView(itemList, isLoading, type);
    }
  } else if (model.response != null) {
    if (itemList.contains(null)) {
      itemList.remove(null);
    }
    itemList.addAll(model.response);
    itemList.add(null);
    return CreateListView(itemList, isLoading, type);
  } else {
    if (itemList.isEmpty) {
      return ErrorTextWidget(model.error);
    } else {
      return CreateListView(itemList, isLoading, type);
    }
  }
}

@widget
Widget createListView(BuildContext context, List<NewsResponseItem> itemList, bool isLoading, String type) {
  ScrollController _scrollController = ScrollController();
  _scrollController.addListener(() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels) {
      if (!isLoading) {
        isLoading = !isLoading;
        newsListBloc.fetchNewsItems(type);
      }
    }
  });
  return ListView.builder(
      controller: _scrollController,
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) =>
          NewsListItem(itemList[index]));
}

