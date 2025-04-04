class ScoreModel {
  ScoreModel({required this.hashGameMode, required this.score});

  final int hashGameMode;
  final int score;

  ScoreModel copyWith({int? hashGameMode, int? score}) {
    return ScoreModel(
      hashGameMode: hashGameMode ?? this.hashGameMode,
      score: score ?? this.score,
    );
  }
}
