import 'package:flutter/material.dart';
import 'package:flutter_app/unitConvertor/Unit.dart';
import 'package:flutter_app/unitConvertor/UnitComponent.dart';

class UnitList extends StatefulWidget {
  const UnitList();

  @override
  State<StatefulWidget> createState() => _UnitList();
}

class _UnitList extends State<UnitList> {
  final unitList = <UnitComponent>[];
  static const _unitNames = <String>[
    "Length",
    "Distance",
    "Weight",
    "Temperature",
  ];

  var unitComponentWidgets = <Widget>[];

  List<Unit> createUnitList(String unitName) {
    return List.generate(10, (int i) {
      i++;
      return Unit("$unitName $i", i.toDouble());
    });
  }

  Widget _unitComponentsList() {
    for (var i = 0; i < _unitNames.length; i++) {
      unitComponentWidgets
          .add(UnitComponent(_unitNames[i], createUnitList(_unitNames[i])));
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          unitComponentWidgets[index],
      itemCount: _unitNames.length,
    );
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
