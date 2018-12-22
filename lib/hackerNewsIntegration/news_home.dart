import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/hackerNewsIntegration/hacker_news_list.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/widgets.dart';

part 'news_home.g.dart';
class NewsHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const NewsTabController());
  }
}

@widget
Widget newsTabController(BuildContext context) {
  return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hacker News"),
          centerTitle: true,
          bottom: TabBar(
              tabs: [Tab(text: "New"), Tab(text: "Top"), Tab(text: "Best")]),
        ),
        body: TabBarView(children: [
          BlocProvider(bloc: NewsListBloc(), child: HackerNewsListWidget("New"),),
          BlocProvider(bloc: NewsListBloc(), child: HackerNewsListWidget("Top"),),
          BlocProvider(bloc: NewsListBloc(), child: HackerNewsListWidget("Best"))
        ]),
      ));
}