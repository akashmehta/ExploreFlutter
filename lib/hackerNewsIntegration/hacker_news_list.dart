import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/common/circular_progress_indicator.dart';
import 'package:flutter_app/common/error_text_widget.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_item.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';

class HackerNewsListWidget extends StatefulWidget {
  final String type;
  EventModel model;

  HackerNewsListWidget(this.type) : assert(type != null);

  @override
  _HackerNewsListWidgetState createState() => _HackerNewsListWidgetState();
}

class _HackerNewsListWidgetState extends State<HackerNewsListWidget>
    with AutomaticKeepAliveClientMixin<HackerNewsListWidget> {
  NewsListBloc newsListBloc;

  @override
  void initState() {
    super.initState();
    newsListBloc = BlocProvider.of<NewsListBloc>(context);
    newsListBloc.fetchNewsItems(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _createList(context, newsListBloc));
  }

  Widget _createList(BuildContext context, NewsListBloc newsListBloc) {
    return StreamBuilder(
        initialData: EventModel(true, null, null),
        stream: newsListBloc.eventStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          widget.model = snapshot.data;
          return _getPage(snapshot.data);
        });
  }

  Widget _getPage(EventModel model) {
    if (model.progress) {
      return ProgressIndicatorWidget();
    } else if (model.response != null) {
      return _createListView(model.response);
    } else {
      return ErrorTextWidget(model.error);
    }
  }

  Widget _createListView(List<NewsResponseItem> itemList) {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        print("Reached to end");
      }
    });
    return ListView.builder(
        controller: _scrollController,
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) =>
            NewsListItem(itemList[index]));
  }

  @override
  bool get wantKeepAlive => true;
}
