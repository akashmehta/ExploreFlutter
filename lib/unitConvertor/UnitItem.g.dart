// GENERATED CODE - DO NOT MODIFY BY HAND

part of UnitItem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<UnitItem> _$unitItemSerializer = new _$UnitItemSerializer();

class _$UnitItemSerializer implements StructuredSerializer<UnitItem> {
  @override
  final Iterable<Type> types = const [UnitItem, _$UnitItem];
  @override
  final String wireName = 'UnitItem';

  @override
  Iterable serialize(Serializers serializers, UnitItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'conversion',
      serializers.serialize(object.conversion,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  UnitItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'conversion':
          result.conversion = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$UnitItem extends UnitItem {
  @override
  final String name;
  @override
  final double conversion;

  factory _$UnitItem([void updates(UnitItemBuilder b)]) =>
      (new UnitItemBuilder()..update(updates)).build();

  _$UnitItem._({this.name, this.conversion}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('UnitItem', 'name');
    }
    if (conversion == null) {
      throw new BuiltValueNullFieldError('UnitItem', 'conversion');
    }
  }

  @override
  UnitItem rebuild(void updates(UnitItemBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitItemBuilder toBuilder() => new UnitItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitItem &&
        name == other.name &&
        conversion == other.conversion;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), conversion.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UnitItem')
          ..add('name', name)
          ..add('conversion', conversion))
        .toString();
  }
}

class UnitItemBuilder implements Builder<UnitItem, UnitItemBuilder> {
  _$UnitItem _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  double _conversion;
  double get conversion => _$this._conversion;
  set conversion(double conversion) => _$this._conversion = conversion;

  UnitItemBuilder();

  UnitItemBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _conversion = _$v.conversion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnitItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UnitItem;
  }

  @override
  void update(void updates(UnitItemBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UnitItem build() {
    final _$result =
        _$v ?? new _$UnitItem._(name: name, conversion: conversion);
    replace(_$result);
    return _$result;
  }
}
