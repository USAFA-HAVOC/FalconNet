import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie<T> with _$Movie<T> {
  factory Movie({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'vote_average') required double rating,
    @JsonKey(name: 'overview') required String overview,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'poster_path') String? poster,
  }) = _ApiError<T>;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
