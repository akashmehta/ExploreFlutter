import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/common/circular_progress_indicator.dart';
import 'package:flutter_app/common/error_text_widget.dart';
import 'package:flutter_app/hackerNewsIntegration/hacker_news_list.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';

class NewsHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Hacker News"),
              centerTitle: true,
              bottom: TabBar(tabs: [
                Tab(text: "New"),
                Tab(text: "Top"),
                Tab(text: "Best")
              ]),
            ),
            body: TabBarView(children: [
              _newsPage(context, "New"),
              _newsPage(context, "Top"),
              _newsPage(context, "Best")
            ]),
          )),
    );
  }

  Widget _newsPage(BuildContext context, String type) {
    final NewsListBloc newsListBloc = BlocProvider.of<NewsListBloc>(context);
    return StreamBuilder(
        initialData: EventModel(true, null, null),
        stream: newsListBloc.eventStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          EventModel model = snapshot.data;
          if (model.progress) {
            return ProgressIndicatorWidget();
          } else if (model.response != null) {
            return HackerNewsListWidget(model.response);
          } else {
            return ErrorTextWidget(snapshot.data);
          }
        });
  }
}
