import 'package:flutter/material.dart';
import 'package:flutter_app/hackerNewsIntegration/new_news_list.dart';

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
              NewNewsList("New"),
              NewNewsList("Top"),
              NewNewsList("Best")
            ]),
          )
      ),
    );
  }
}
