import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/serializer.dart';
import 'package:flutter_app/unitConvertor/UnitComponent.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_app/unitConvertor/UnitItem.dart';

class UnitList extends StatefulWidget {
  const UnitList();

  @override
  State<StatefulWidget> createState() => _UnitList();
}

class _UnitList extends State<UnitList> {
  var unitComponentWidgets = <Widget>[];

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (unitComponentWidgets.isEmpty) {
      await _retrieveLocalCategories();
    }
  }

  Future<void> _retrieveLocalCategories() async {
    final standardSerializers =
        (serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();

    var json = DefaultAssetBundle.of(context)
        .loadString("assets/data/regular_units.json");
    var data = JsonDecoder().convert(await json);
    if (data is Map) {
      data.keys.forEach((key) {
        List<UnitItem> units = data[key]
            .map<UnitItem>((dynamic data) =>
                standardSerializers.deserializeWith(UnitItem.serializer, data))
            .toList();
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
