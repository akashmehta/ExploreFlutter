import 'package:flutter/material.dart';
import 'package:flutter_app/common/bloc_provider.dart';
import 'package:flutter_app/hackerNewsIntegration/news_home.dart';
import 'package:flutter_app/hackerNewsIntegration/news_list_bloc.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/widgets.dart';

part 'main.g.dart';
void main() => runApp(const MyApp());

@widget
Widget myApp(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        bloc: NewsListBloc(),
        child: NewsHomeWidget(),
      ));
}