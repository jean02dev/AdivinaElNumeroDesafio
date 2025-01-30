import 'package:desafio_adivina_el_numero/domain/entities/game_entity.dart';
import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';
import 'package:desafio_adivina_el_numero/config/helpers/attempts_for_level.dart';
import 'package:desafio_adivina_el_numero/config/helpers/generate_number.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_providers.g.dart';

@Riverpod(keepAlive: true)
class GameProviders extends _$GameProviders {
  @override
  GameEntity build() {
    Level level = Level.facil;

    return GameEntity(
      level: level,
      targetNumber: generateNumber(level),
      attempts: attemptsForLevel(level),
      history: [],
    );
  }

  void updateLevel(Level newLevel) {
    state = state.copyWith(
      level: newLevel,
      targetNumber: generateNumber(newLevel),
      attempts: attemptsForLevel(newLevel),
      higherNumbers: [],
      lowerNumbers: [],
      history: state.history,
      isGameWon: false,
    );
  }

  void guessNumber(int number) {
    int remainingAttempts = state.attempts - 1;
    Level currentLevel = state.level;
    bool isCorrectNumber = false;

    if (number == state.targetNumber) {
      isCorrectNumber = true;
    } else if (number > state.targetNumber) {
      state = state.copyWith(
        higherNumbers: [...state.higherNumbers, number],
        history: state.history,
      );
    } else if (number < state.targetNumber) {
      state = state.copyWith(
        lowerNumbers: [...state.lowerNumbers, number],
        history: state.history,
      );
    }

    if (remainingAttempts <= 0 || isCorrectNumber) {
      state = state.copyWith(
        history: [
          ...state.history,
          {'number': state.targetNumber, 'isCorrect': isCorrectNumber},
        ],
        targetNumber: generateNumber(currentLevel),
        attempts: attemptsForLevel(currentLevel),
        higherNumbers: [],
        lowerNumbers: [],
        isGameWon: isCorrectNumber,
      );
    } else {
      state = state.copyWith(
        attempts: remainingAttempts,
        history: state.history,
        isGameWon: isCorrectNumber,
      );
    }
  }
}
