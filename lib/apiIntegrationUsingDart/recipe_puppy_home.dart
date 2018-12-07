

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RecipePuppyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe puppy list"),
        centerTitle: true,
      ),
      body: Container(
        child : FutureBuilder(
            builder: null
        ),
      ),
    );
  }

  void _fetchData() {
    var api =  get("");
  }
}