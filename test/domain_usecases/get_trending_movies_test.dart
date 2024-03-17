import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movix/domain/entities/Movie.dart';
import 'package:movix/domain/repositories/movie_repository.dart';
import 'package:movix/domain/usecases/get_trending_movies.dart';
import 'package:mockito/annotations.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late GetTrendingMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetTrendingMovies(mockMovieRepository);
  });

  final tMovieList = [
    Movie(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    Movie(
        id: 2, title: "Test Movie 2", overview: "Desc 2", posterPath: "/image2")
  ];

  test('should get trending movies from the repository', () async {
    // arrange
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => tMovieList);

    // act
    final result = await usecase();

    // assert
    expect(result, tMovieList);
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
