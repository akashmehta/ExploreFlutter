

import 'dart:convert';

import 'package:flutter_app/unitConvertor/Unit.dart';
import 'package:http/http.dart';

class UnitIntegration {
  final String _url = 'https://flutter.udacity.com';

  Future<Map<String, dynamic>> getUnits(String category) async {
    final response = await get(_url + '/$category');
    return JsonDecoder().convert(response.body);
  }

  Future<Map<String, dynamic>> getUnitItems(String category) async {
    var json = await getUnits(category);
    return json;
  }
}