import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/unitApiIntegration/unitApiIntegration.dart';
import 'package:flutter_app/unitConvertor/UnitConverter.dart';
import 'package:flutter_app/unitConvertor/UnitResponse.dart';

class UnitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: UnitIntegration().getUnitItems("currency"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<String, dynamic> json = snapshot.data;
                  UnitResponse response = UnitResponse.fromJson(json);
                  return UnitConverter(units: response.units);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: Text(
                    "Data couldn't be fetched : ${snapshot.error.toString()}",
                  ),
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
