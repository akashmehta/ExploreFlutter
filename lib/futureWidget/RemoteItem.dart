import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/futureWidget/Post.dart';
import 'package:http/http.dart';

class RemoteItem extends StatelessWidget {
  Future<Post> fetchResponse() async {
    final response = await get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      return Post.fromJson(JsonDecoder().convert(response.body));
    } else {
      throw Exception("Unable to load items");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FutureBuilder(
          future: fetchResponse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      snapshot.data.title,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      snapshot.data.body,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(snapshot.error.toString()),
              );
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
