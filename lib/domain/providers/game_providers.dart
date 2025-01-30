import 'dart:math';

import 'package:desafio_adivina_el_numero/domain/entities/game_entity.dart';
import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_providers.g.dart';

@Riverpod(keepAlive: true)
class GameProviders extends _$GameProviders {
  @override
  GameEntity build() {
    Level level = Level.easy;
    return GameEntity(
        level: Level.easy,
        targetNumber: _generateNumber(level),
        attempts: _attemptsForLevel(level),
        history: []);
  }

  void updateLevel(Level newLevel) {
    state = state.copyWith(
      level: newLevel,
      targetNumber: _generateNumber(newLevel),
      attempts: _attemptsForLevel(newLevel),
      higherNumbers: [],
      lowerNumbers: [],
    );
  }

  void guessNumber(int number) {
    int remainingAttempts = state.attempts - 1;
    Level currentLevel = state.level;
    bool gameWon = false;

    if (number == state.targetNumber) {
      gameWon = true;
    } else if (number > state.targetNumber) {
      state = state.copyWith(higherNumbers: [...state.higherNumbers, number]);
    } else if (number < state.targetNumber) {
      state = state.copyWith(lowerNumbers: [...state.lowerNumbers, number]);
    }

    if (remainingAttempts <= 0 || gameWon) {
      state = state.copyWith(
        history: [...state.history, state.targetNumber],
        targetNumber: _generateNumber(currentLevel),
        attempts: _attemptsForLevel(currentLevel),
        higherNumbers: [...state.higherNumbers],
        lowerNumbers: [...state.lowerNumbers],
      );
    } else {
      state = state.copyWith(attempts: remainingAttempts);
    }
  }

  int _generateNumber(Level level) {
    switch (level) {
      case Level.easy:
        return Random().nextInt(10) + 1;
      case Level.medium:
        return Random().nextInt(20) + 1;
      case Level.hard:
        return Random().nextInt(100) + 1;
      case Level.expert:
        return Random().nextInt(1000) + 1;
    }
  }

  int _attemptsForLevel(Level level) {
    switch (level) {
      case Level.easy:
        return 5;
      case Level.medium:
        return 8;
      case Level.hard:
        return 15;
      case Level.expert:
        return 25;
    }
  }
}
