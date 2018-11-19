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
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  static const _icons = <IconData>[
    Icons.cake,
    Icons.print,
    Icons.accessibility,
    Icons.accessible,
    Icons.add_shopping_cart,
    Icons.airline_seat_individual_suite,
    Icons.airplanemode_active,
    Icons.ac_unit
  ];

  static const _backGroundColor = Colors.black12;
  static const _verticalPadding = 10.0;
  static const _title = Text("List Screen", style: TextStyle(color: Colors.white, fontSize: 16.0),);
  @override
  Widget build(BuildContext context) {
    final itemComponents = <ItemComponent>[];
    for (var i = 0; i < _categoryNames.length; i++) {
      itemComponents.add(ItemComponent(name: _categoryNames[i],
          color: _colorNames[i],
          icon: _icons[i]));
    }

    var _listView = _buildCategoryWidgets(itemComponents);
    var _body = Container(
      color: _backGroundColor,
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      child: _listView,
    );

    var _appBar = AppBar(
      title: _title,
      backgroundColor: Colors.black,
    );

    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  Widget _buildCategoryWidgets(List<Widget> widgets) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => widgets[index],
      itemCount: widgets.length,);
  }

}