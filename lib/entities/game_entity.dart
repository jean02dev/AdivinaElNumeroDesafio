import 'package:desafio_adivina_el_numero/entities/levels_enum.dart';

class GameEntity {
  final Level level;
  final int targetNumber;
  final int attempts;
  final List<int> higherNumbers;
  final List<int> lowerNumbers;
  final List<Map<String, dynamic>> history;
  final bool isGameWon;

  GameEntity({
    required this.level,
    required this.targetNumber,
    required this.attempts,
    this.higherNumbers = const [],
    this.lowerNumbers = const [],
    this.history = const [],
    this.isGameWon = false,
  });

  GameEntity copyWith({
    Level? level,
    int? targetNumber,
    int? attempts,
    List<int>? higherNumbers,
    List<int>? lowerNumbers,
    required List<Map<String, dynamic>> history,
    bool? isGameWon,
  }) {
    return GameEntity(
      level: level ?? this.level,
      targetNumber: targetNumber ?? this.targetNumber,
      attempts: attempts ?? this.attempts,
      higherNumbers: higherNumbers ?? this.higherNumbers,
      lowerNumbers: lowerNumbers ?? this.lowerNumbers,
      history: history,
      isGameWon: isGameWon ?? this.isGameWon,
    );
  }
}
