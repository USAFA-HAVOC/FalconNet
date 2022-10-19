import '../../models/movie_response/movie_response.dart';

/// Abstract class defining [MovieRepository] structure
abstract class MovieRepository {
  /// Get paginated [Movie]s
  Future<MovieResponse> getMovies({int page = 1});
}
