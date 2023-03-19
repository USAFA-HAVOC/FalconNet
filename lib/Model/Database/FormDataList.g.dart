// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormDataList.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FormDataList> _$formDataListSerializer =
    new _$FormDataListSerializer();

class _$FormDataListSerializer implements StructuredSerializer<FormDataList> {
  @override
  final Iterable<Type> types = const [FormDataList, _$FormDataList];
  @override
  final String wireName = 'FormDataList';

  @override
  Iterable<Object?> serialize(Serializers serializers, FormDataList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'forms',
      serializers.serialize(object.forms,
          specifiedType:
              const FullType(BuiltList, const [const FullType(FormOneData)])),
    ];

    return result;
  }

  @override
  FormDataList deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FormDataListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'forms':
          result.forms.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(FormOneData)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$FormDataList extends FormDataList {
  @override
  final BuiltList<FormOneData> forms;

  factory _$FormDataList([void Function(FormDataListBuilder)? updates]) =>
      (new FormDataListBuilder()..update(updates))._build();

  _$FormDataList._({required this.forms}) : super._() {
    BuiltValueNullFieldError.checkNotNull(forms, r'FormDataList', 'forms');
  }

  @override
  FormDataList rebuild(void Function(FormDataListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FormDataListBuilder toBuilder() => new FormDataListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormDataList && forms == other.forms;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, forms.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FormDataList')..add('forms', forms))
        .toString();
  }
}

class FormDataListBuilder
    implements Builder<FormDataList, FormDataListBuilder> {
  _$FormDataList? _$v;

  ListBuilder<FormOneData>? _forms;
  ListBuilder<FormOneData> get forms =>
      _$this._forms ??= new ListBuilder<FormOneData>();
  set forms(ListBuilder<FormOneData>? forms) => _$this._forms = forms;

  FormDataListBuilder();

  FormDataListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _forms = $v.forms.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FormDataList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FormDataList;
  }

  @override
  void update(void Function(FormDataListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FormDataList build() => _build();

  _$FormDataList _build() {
    _$FormDataList _$result;
    try {
      _$result = _$v ?? new _$FormDataList._(forms: forms.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'forms';
        forms.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FormDataList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
