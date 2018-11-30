library example;

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Unit.g.dart';

@JsonSerializable()
class Unit {
  final String name;
  final double conversion;

  const Unit(this.name, this.conversion);

  factory Unit.fromJson(Map jsonMap) => _$UnitFromJson(jsonMap);
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
