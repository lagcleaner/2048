enum GameStatus {
  playing,
  over,
  won,
  paused,
  stoped;

  bool get isOver => this == GameStatus.over;
  bool get isWon => this == GameStatus.won;
  bool get isPlaying => [GameStatus.playing, GameStatus.won].contains(this);
}
