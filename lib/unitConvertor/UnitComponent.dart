import 'package:flutter/material.dart';
import 'package:flutter_app/unitConvertor/Unit.dart';
import 'package:flutter_app/unitConvertor/UnitConverter.dart';

class UnitComponent extends StatelessWidget {
  final List<Unit> units;
  final String title;
  final String imageLocation;

  const UnitComponent(
      @required this.title, @required this.imageLocation, @required this.units)
      : assert(units != null),
        assert(title != null),
        assert(imageLocation != null);

  void _navigateToUnitConverter(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: UnitConverter(
          units: units,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: InkWell(
          onTap: () => _navigateToUnitConverter(context),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(imageLocation),
              ),
              Center(
                child: Text(title),
              )
            ],
          ),
        ),
      ),
    );
  }
}
