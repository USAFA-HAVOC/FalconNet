// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PassHistoryModel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PassHistoryModel> _$passHistoryModelSerializer =
    new _$PassHistoryModelSerializer();

class _$PassHistoryModelSerializer
    implements StructuredSerializer<PassHistoryModel> {
  @override
  final Iterable<Type> types = const [PassHistoryModel, _$PassHistoryModel];
  @override
  final String wireName = 'PassHistoryModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PassHistoryModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'history',
      serializers.serialize(object.history,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CadetPass)])),
    ];

    return result;
  }

  @override
  PassHistoryModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PassHistoryModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'history':
          result.history.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CadetPass)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PassHistoryModel extends PassHistoryModel {
  @override
  final BuiltList<CadetPass> history;

  factory _$PassHistoryModel(
          [void Function(PassHistoryModelBuilder)? updates]) =>
      (new PassHistoryModelBuilder()..update(updates))._build();

  _$PassHistoryModel._({required this.history}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        history, r'PassHistoryModel', 'history');
  }

  @override
  PassHistoryModel rebuild(void Function(PassHistoryModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PassHistoryModelBuilder toBuilder() =>
      new PassHistoryModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PassHistoryModel && history == other.history;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, history.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PassHistoryModel')
          ..add('history', history))
        .toString();
  }
}

class PassHistoryModelBuilder
    implements Builder<PassHistoryModel, PassHistoryModelBuilder> {
  _$PassHistoryModel? _$v;

  ListBuilder<CadetPass>? _history;
  ListBuilder<CadetPass> get history =>
      _$this._history ??= new ListBuilder<CadetPass>();
  set history(ListBuilder<CadetPass>? history) => _$this._history = history;

  PassHistoryModelBuilder();

  PassHistoryModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _history = $v.history.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PassHistoryModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PassHistoryModel;
  }

  @override
  void update(void Function(PassHistoryModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PassHistoryModel build() => _build();

  _$PassHistoryModel _build() {
    _$PassHistoryModel _$result;
    try {
      _$result = _$v ?? new _$PassHistoryModel._(history: history.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'history';
        history.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PassHistoryModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
