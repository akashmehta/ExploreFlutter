import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/unitConvertor/Unit.dart';
import 'package:flutter_app/unitConvertor/UnitComponent.dart';

class UnitList extends StatefulWidget {
  const UnitList();

  @override
  State<StatefulWidget> createState() => _UnitList();
}

class _UnitList extends State<UnitList> {

  var unitComponentWidgets = <Widget>[];

  List<Unit> createUnitList(String unitName) {
    return List.generate(10, (int i) {
      i++;
      return Unit("$unitName $i", i.toDouble());
    });
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (unitComponentWidgets.isEmpty) {
      await _retrieveLocalCategories();
    }
  }

  Future<void> _retrieveLocalCategories() async {
    var json = DefaultAssetBundle.of(context).loadString("assets/data/regular_units.json");
    var data = JsonDecoder().convert(await json);
    if (data is Map) {
      data.keys.forEach ((key) {
        List<Unit> units = data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();
        unitComponentWidgets.add(UnitComponent(key, units));
      });
    } else {
      throw ('Data is not in proper syntex');
    }
  }

  Widget _unitComponentsList() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            unitComponentWidgets[index],
        itemCount: unitComponentWidgets.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3,
        children: unitComponentWidgets,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit List"),
      ),
      body: _unitComponentsList(),
    );
  }
}
