import 'package:movix/domain/entities/Movie.dart';
import 'package:movix/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getPopularMovies();
  }
}
