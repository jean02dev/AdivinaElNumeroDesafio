enum Level { easy, medium, hard, expert }

class GameEntity {
  final Level level;
  final int targetNumber;
  final int attempts;
  final List<int> higherNumbers;
  final List<int> lowerNumbers;
  final List<int> history;

  GameEntity({
    required this.level,
    required this.targetNumber,
    required this.attempts,
    this.higherNumbers = const [],
    this.lowerNumbers = const [],
    this.history = const [],
  });
}
