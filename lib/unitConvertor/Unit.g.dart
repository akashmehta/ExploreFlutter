// GENERATED CODE - DO NOT MODIFY BY HAND

part of example;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unit _$UnitFromJson(Map<String, dynamic> json) {
  return Unit(json['name'] as String, (json['conversion'] as num)?.toDouble());
}

Map<String, dynamic> _$UnitToJson(Unit instance) =>
    <String, dynamic>{'name': instance.name, 'conversion': instance.conversion};
