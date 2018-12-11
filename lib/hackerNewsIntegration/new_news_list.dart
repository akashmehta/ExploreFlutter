import 'package:flutter/material.dart';

class NewNewsList extends StatelessWidget {
  final String type;

  NewNewsList(@required this.type) : assert(type != null);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(type));
  }
}
