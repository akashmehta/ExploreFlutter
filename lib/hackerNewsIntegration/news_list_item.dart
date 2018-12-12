import 'package:flutter/material.dart';
import 'package:flutter_app/hackerNewsIntegration/news_response.dart';

class NewsListItem extends StatelessWidget {
  final NewsResponseItem newsResponseItem;

  NewsListItem(this.newsResponseItem);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(newsResponseItem.title),
      ),
    ));
  }
}
