library unit_item;

import 'package:flutter_app/unitConvertor/Unit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UnitItem.g.dart';

@JsonSerializable()
class UnitItem {
  final String icon;
  final List<Unit> data;

  const UnitItem(this.icon, this.data);

  factory UnitItem.fromJson(Map jsonMap) => _$UnitItemFromJson(jsonMap);
  Map<String, dynamic> toJson() => _$UnitItemToJson(this);
}