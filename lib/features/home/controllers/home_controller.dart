import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/movie/movie.dart';
import '../../../providers/repositories_providers.dart';
import '../../../repositories/movie/http_movie_repository.dart';

final currentPageProvider = StateProvider<int>((ref) => 1);
final totalPagesProvider = StateProvider<int>((ref) => 1);

class HomeController extends StateNotifier<AsyncValue<List<Movie>>> {
  HomeController(this.ref, this.movieRepository) : super(const AsyncValue.loading()) {
    getMovies();
  }
  final HttpMovieRepository movieRepository;
  final Ref ref;

  Future<void> getMovies() async {
    state = const AsyncValue.loading();

    /// AsyncValue.guard() automatically catches all exceptions
    state = await AsyncValue.guard(() async {
      /// Fetch movies
      final movieData = await movieRepository.getMovies(
        page: ref.read(currentPageProvider),
      );

      /// Set total pages
      ref.read(totalPagesProvider.state).state = movieData.totalPages;

      /// Return list of movies
      return movieData.movies;
    });
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, AsyncValue<List<Movie>>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return HomeController(ref, movieRepository);
});
