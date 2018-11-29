library serializers;

import 'package:built_value/serializer.dart';
import 'package:flutter_app/unitConvertor/UnitItem.dart';



part "serializers.g.dart";

@SerializersFor(const [
  UnitItem
])

final Serializers serializers = _$serializers;