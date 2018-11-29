library UnitItem;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'UnitItem.g.dart';

abstract class UnitItem implements Built<UnitItem, UnitItemBuilder> {
  UnitItem._();
  factory UnitItem([updates(UnitItemBuilder b)]) = _$UnitItem;
  String get name;
  double get conversion;

  static Serializer<UnitItem> get serializer => _$unitItemSerializer;
}
