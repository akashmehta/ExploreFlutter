

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RemoteItem extends StatelessWidget {
  Future<Response> fetchResponse() {
    return get('https://jsonplaceholder.typicode.com/posts/1');
  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder(
      future: post,
      builder: (context, snapshot) {
        return CircularProgressIndicator();
      },
    );
  }

}