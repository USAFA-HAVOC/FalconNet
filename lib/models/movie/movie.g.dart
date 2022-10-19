// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiError<T> _$$_ApiErrorFromJson<T>(Map<String, dynamic> json) =>
    _$_ApiError<T>(
      id: json['id'] as int,
      title: json['title'] as String,
      rating: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      poster: json['poster_path'] as String?,
    );

Map<String, dynamic> _$$_ApiErrorToJson<T>(_$_ApiError<T> instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'vote_average': instance.rating,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'poster_path': instance.poster,
    };
