import 'package:flutter/material.dart';
import 'ItemComponent.dart';
class ListComponent extends StatelessWidget {

  static const _categoryNames = <String>[
    "Length",
    "Area",
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency'
  ];

  static const _colorNames = <Color>[
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.yellow
  ];
  @override
  Widget build(BuildContext context) {
    final itemComponents = <ItemComponent>[];
    for(var i = 0 ; i < _categoryNames.length;i++) {

    }

  }
}