import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movix/domain/entities/Movie.dart';
import 'package:movix/domain/usecases/search_movies.dart';

import 'get_trending_movies_test.mocks.dart';

void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
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

  final tQuery = 'Inception';

  test('should get movies from the query', () async {
    // arrange
    when(mockMovieRepository.searchMovies(tQuery))
        .thenAnswer((_) async => tMovieList);

    // act
    final result = await usecase(tQuery);

    // assert
    expect(result, tMovieList);
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
