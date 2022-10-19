// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Movie<T> _$MovieFromJson<T>(Map<String, dynamic> json) {
  return _ApiError<T>.fromJson(json);
}

/// @nodoc
mixin _$Movie<T> {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview')
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get poster => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<T, Movie<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<T, $Res> {
  factory $MovieCopyWith(Movie<T> value, $Res Function(Movie<T>) then) =
      _$MovieCopyWithImpl<T, $Res, Movie<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'vote_average') double rating,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'poster_path') String? poster});
}

/// @nodoc
class _$MovieCopyWithImpl<T, $Res, $Val extends Movie<T>>
    implements $MovieCopyWith<T, $Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? rating = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? poster = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiErrorCopyWith<T, $Res>
    implements $MovieCopyWith<T, $Res> {
  factory _$$_ApiErrorCopyWith(
          _$_ApiError<T> value, $Res Function(_$_ApiError<T>) then) =
      __$$_ApiErrorCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'vote_average') double rating,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'poster_path') String? poster});
}

/// @nodoc
class __$$_ApiErrorCopyWithImpl<T, $Res>
    extends _$MovieCopyWithImpl<T, $Res, _$_ApiError<T>>
    implements _$$_ApiErrorCopyWith<T, $Res> {
  __$$_ApiErrorCopyWithImpl(
      _$_ApiError<T> _value, $Res Function(_$_ApiError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? rating = null,
    Object? overview = null,
    Object? releaseDate = null,
    Object? poster = freezed,
  }) {
    return _then(_$_ApiError<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiError<T> implements _ApiError<T> {
  _$_ApiError(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'vote_average') required this.rating,
      @JsonKey(name: 'overview') required this.overview,
      @JsonKey(name: 'release_date') required this.releaseDate,
      @JsonKey(name: 'poster_path') this.poster});

  factory _$_ApiError.fromJson(Map<String, dynamic> json) =>
      _$$_ApiErrorFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'vote_average')
  final double rating;
  @override
  @JsonKey(name: 'overview')
  final String overview;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey(name: 'poster_path')
  final String? poster;

  @override
  String toString() {
    return 'Movie<$T>(id: $id, title: $title, rating: $rating, overview: $overview, releaseDate: $releaseDate, poster: $poster)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiError<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.poster, poster) || other.poster == poster));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, rating, overview, releaseDate, poster);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiErrorCopyWith<T, _$_ApiError<T>> get copyWith =>
      __$$_ApiErrorCopyWithImpl<T, _$_ApiError<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiErrorToJson<T>(
      this,
    );
  }
}

abstract class _ApiError<T> implements Movie<T> {
  factory _ApiError(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'vote_average') required final double rating,
      @JsonKey(name: 'overview') required final String overview,
      @JsonKey(name: 'release_date') required final String releaseDate,
      @JsonKey(name: 'poster_path') final String? poster}) = _$_ApiError<T>;

  factory _ApiError.fromJson(Map<String, dynamic> json) =
      _$_ApiError<T>.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'vote_average')
  double get rating;
  @override
  @JsonKey(name: 'overview')
  String get overview;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  @JsonKey(name: 'poster_path')
  String? get poster;
  @override
  @JsonKey(ignore: true)
  _$$_ApiErrorCopyWith<T, _$_ApiError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
