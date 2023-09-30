// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FormList.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FormList> _$formListSerializer = new _$FormListSerializer();

class _$FormListSerializer implements StructuredSerializer<FormList> {
  @override
  final Iterable<Type> types = const [FormList, _$FormList];
  @override
  final String wireName = 'FormList';

  @override
  Iterable<Object?> serialize(Serializers serializers, FormList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'forms',
      serializers.serialize(object.forms,
          specifiedType:
              const FullType(BuiltList, const [const FullType(FormSummary)])),
    ];

    return result;
  }

  @override
  FormList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FormListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'forms':
          result.forms.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(FormSummary)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$FormList extends FormList {
  @override
  final BuiltList<FormSummary> forms;

  factory _$FormList([void Function(FormListBuilder)? updates]) =>
      (new FormListBuilder()..update(updates))._build();

  _$FormList._({required this.forms}) : super._() {
    BuiltValueNullFieldError.checkNotNull(forms, r'FormList', 'forms');
  }

  @override
  FormList rebuild(void Function(FormListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FormListBuilder toBuilder() => new FormListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FormList && forms == other.forms;
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
    return (newBuiltValueToStringHelper(r'FormList')..add('forms', forms))
        .toString();
  }
}

class FormListBuilder implements Builder<FormList, FormListBuilder> {
  _$FormList? _$v;

  ListBuilder<FormSummary>? _forms;
  ListBuilder<FormSummary> get forms =>
      _$this._forms ??= new ListBuilder<FormSummary>();
  set forms(ListBuilder<FormSummary>? forms) => _$this._forms = forms;

  FormListBuilder();

  FormListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _forms = $v.forms.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FormList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FormList;
  }

  @override
  void update(void Function(FormListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FormList build() => _build();

  _$FormList _build() {
    _$FormList _$result;
    try {
      _$result = _$v ?? new _$FormList._(forms: forms.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'forms';
        forms.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FormList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
