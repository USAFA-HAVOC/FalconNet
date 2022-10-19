import '../../constants/endpoints.dart';
import '../../models/movie_response/movie_response.dart';
import '../../services/api/dio_service.dart';
import 'movie_repository.dart';

class HttpMovieRepository implements MovieRepository {
  final DioService api;

  HttpMovieRepository({
    required this.api,
  });

  @override
  Future<MovieResponse> getMovies({int page = 1}) => api.request(
        method: HttpMethod.get,
        url: 'movie/popular',
        parameters: {'page': page},
        builder: (data) => MovieResponse.fromJson(data),
        token: AppEndpoints.defaultToken,
      );
}
