import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/unitApiIntegration/unitApiIntegration.dart';
import 'package:flutter_app/unitConvertor/UnitConverter.dart';

class UnitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: UnitIntegration().getUnitItems(""),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return UnitConverter();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Data couldn't be fetched",),
                );
              }
              return CircularProgressIndicator(
                backgroundColor: Colors.teal,
                strokeWidth: 1,
              );
            },
          ),
        ),
      ),
    );
  }
}
