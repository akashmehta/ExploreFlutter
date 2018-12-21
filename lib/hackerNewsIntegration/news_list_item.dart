import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/common/circular_progress_indicator.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsListItem extends StatelessWidget {
  final NewsResponseItem newsResponseItem;
  final int itemPosition;

  NewsListItem(this.newsResponseItem, this.itemPosition);

  @override
  Widget build(BuildContext context) {
    return Container(child: NewsListItemChild(newsResponseItem, itemPosition));
  }
}

class NewsListItemChild extends StatelessWidget {
  final NewsResponseItem newsResponseItem;
  final int itemPosition;

  const NewsListItemChild(this.newsResponseItem, this.itemPosition);

  @override
  Widget build(BuildContext context) {
    NewsListBloc newsListBloc = BlocProvider.of<NewsListBloc>(context);
    if (newsResponseItem == null) {
      return Center(
        child: ProgressIndicatorWidget(),
      );
    } else {
      return Material(
        child: Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border.all(color: Colors.grey[400], width: 0.3),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: StreamBuilder(
                    stream: newsListBloc.itemStream.asBroadcastStream(),
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot) {
                      int position = snapshot.data;
                      newsResponseItem?.setIsExpanded =
                          position == itemPosition;
                      print(
                          "Item $itemPosition is ${newsResponseItem?.isExpanded}");
                      return ExpansionTile(
                        initiallyExpanded: position == itemPosition,
                        onExpansionChanged: (isExpanded) {
                          newsResponseItem.setIsExpanded = true;
                          newsListBloc.setOpenIndex(itemPosition);
                        },
                        title: Text(
                          newsResponseItem.title,
                          style: TextStyle(fontSize: 18),
                        ),
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.person),
                                  ),
                                  Center(
                                    child: Text(newsResponseItem.by),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.of(context).pop();
                                  }
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return new MaterialApp(
                                      routes: {
                                        "/": (_) => new WebviewScaffold(
                                              url: newsResponseItem.url,
                                              appBar: new AppBar(
                                                title: new Text(
                                                    newsResponseItem.title),
                                              ),
                                            ),
                                      },
                                    );
                                  }));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(Icons.share),
                                    ),
                                    Center(
                                      child: Text("share"),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    })),
          ),
        ),
      );
    }
  }
}
