

import 'dart:convert';

import 'package:flutter_app/unitConvertor/Unit.dart';
import 'package:http/http.dart';

class UnitIntegration {
  final String _url = 'flutter.udacity.com';

  Future<List> getUnits(String category) async {
    final response = await get(_url + '/$category');
    Map<String, dynamic> map = JsonDecoder().convert(response.body);
    return map['units'];
  }

  Future<List<Unit>> getUnitItems(String category) async {
    var jsonMap = await getUnits(category);
    List<Unit> units = [];
    for (var unit in jsonMap) {
      units.add(Unit.fromJson(unit));
    }
    return units;
  }
}