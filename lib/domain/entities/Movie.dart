class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });
}

// 여기서는 아무것도 전달하고 있지 않다.
// 데이터의 구조를 정의하는데 집중되어 있으며, 실제 비즈니스 로직은 이 클래스 외부에 구현될 것