import 'dart:math';

import 'package:desafio_adivina_el_numero/domain/entities/game_entity.dart';
import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_providers.g.dart';

@Riverpod(keepAlive: true)
class GameProviders extends _$GameProviders {
  @override
  GameEntity build() {
    Level level = Level.facil;

    return GameEntity(
      level: Level.facil,
      targetNumber: _generateNumber(level),
      attempts: _attemptsForLevel(level),
      history: [],
    );
  }

  void updateLevel(Level newLevel) {
    state = state.copyWith(
      level: newLevel,
      targetNumber: _generateNumber(newLevel),
      attempts: _attemptsForLevel(newLevel),
      higherNumbers: [],
      lowerNumbers: [],
      isGameWon: false,
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
        higherNumbers: [],
        lowerNumbers: [],
        isGameWon: gameWon,
      );
    } else {
      state = state.copyWith(attempts: remainingAttempts, isGameWon: gameWon);
    }
  }

  int _generateNumber(Level level) {
    switch (level) {
      case Level.facil:
        return Random().nextInt(10) + 1;
      case Level.medio:
        return Random().nextInt(20) + 1;
      case Level.avanzado:
        return Random().nextInt(100) + 1;
      case Level.extremo:
        return Random().nextInt(1000) + 1;
    }
  }

  int _attemptsForLevel(Level level) {
    switch (level) {
      case Level.facil:
        return 5;
      case Level.medio:
        return 8;
      case Level.avanzado:
        return 15;
      case Level.extremo:
        return 25;
    }
  }
}
