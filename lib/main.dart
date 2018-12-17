import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/hackerNewsIntegration/news_home.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';
import 'package:flutter_app/infiniteScroll/news_list_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          bloc: NewsListBloc(),
          child: NewsHomeWidget(),
        ));
  }
}
