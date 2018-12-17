import 'package:flutter/material.dart';
import 'package:flutter_app/common/circular_progress_indicator.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsListItem extends StatelessWidget {
  final NewsResponseItem newsResponseItem;

  NewsListItem(this.newsResponseItem);

  @override
  Widget build(BuildContext context) {
    return Container(child: _rowWidget(context, newsResponseItem));
  }

  void _navigateToWebViewScreen(
      BuildContext context, NewsResponseItem newsResponseItem) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return new MaterialApp(
        routes: {
          "/": (_) => new WebviewScaffold(
            url: newsResponseItem.url,
            appBar: new AppBar(
              title: new Text(newsResponseItem.title),
            ),
          ),
        },
      );
    }));
  }

  Widget _rowWidget(BuildContext context, NewsResponseItem newsResponseItem) {
    if (newsResponseItem == null) {
      return Center(
        child: ProgressIndicatorWidget(),
      );
    } else {
      return Material(
        child: InkWell(
          onTap: () {
            _navigateToWebViewScreen(context, newsResponseItem);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  border: Border.all(color: Colors.grey[400], width: 1.0),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  newsResponseItem.title,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
