import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';

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

  GameEntity copyWith({
    Level? level,
    int? targetNumber,
    int? attempts,
    List<int>? higherNumbers,
    List<int>? lowerNumbers,
    List<int>? history,
  }) {
    return GameEntity(
      level: level ?? this.level,
      targetNumber: targetNumber ?? this.targetNumber,
      attempts: attempts ?? this.attempts,
      higherNumbers: higherNumbers ?? this.higherNumbers,
      lowerNumbers: lowerNumbers ?? this.lowerNumbers,
      history: history ?? this.history,
    );
  }
}
