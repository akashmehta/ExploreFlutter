library unit_response;

import 'package:flutter_app/unitConvertor/Unit.dart';
import 'package:json_annotation/json_annotation.dart';


part 'UnitResponse.g.dart';
@JsonSerializable()
class UnitResponse {
  final List<Unit> units;

  const UnitResponse(this.units);

  factory UnitResponse.fromJson(Map jsonMap) => _$UnitResponseFromJson(jsonMap);
  Map<String, dynamic> toJson() => _$UnitResponseToJson(this);
}