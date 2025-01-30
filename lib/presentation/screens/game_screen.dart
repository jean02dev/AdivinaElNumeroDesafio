import 'package:desafio_adivina_el_numero/domain/entities/game_entity.dart';
import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';
import 'package:desafio_adivina_el_numero/domain/providers/game_providers.dart';
import 'package:desafio_adivina_el_numero/presentation/widgets/colum_values.dart';
import 'package:desafio_adivina_el_numero/presentation/widgets/input_guess_number.dart';
import 'package:desafio_adivina_el_numero/presentation/widgets/slide_values.dart'; // Importa el widget correctamente
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameEntity gameProvider = ref.watch(gameProvidersProvider);
    final Level currentLevel = ref.watch(gameProvidersProvider).level;
    final List<Level> levels = Level.values;
    final TextEditingController numberController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputGuessNumber(
                    numberController: numberController,
                    labelText: 'Adivina un número',
                    onSubmitted: (value) {
                      int guessedNumber = int.tryParse(value) ?? 0;
                      ref
                          .read(gameProvidersProvider.notifier)
                          .guessNumber(guessedNumber);
                    }),
                SizedBox(width: 30),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Intentos'),
                      Text('${gameProvider.attempts}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                ColumValues(
                    headerText: 'Mayor que',
                    bodyText: gameProvider.lowerNumbers),
                ColumValues(
                    headerText: 'Menor que',
                    bodyText: gameProvider.higherNumbers),
                ColumValues(
                  headerText: 'Historial',
                  bodyText: gameProvider.history,
                  isHistory: true,
                  isGameWon: gameProvider.isGameWon,
                )
              ],
            ),
            SizedBox(height: 30),
            Text('Nivel ${currentLevel.name}', textAlign: TextAlign.center),
            SizedBox(height: 10),
            SlideValues(
                value: levels.indexOf(currentLevel).toDouble(),
                min: 0,
                max: levels.length - 1.toDouble(),
                divisions: levels.length - 1,
                label: currentLevel.name,
                onChange: (value) {
                  final newLevel = levels[value.toInt()];
                  ref
                      .read(gameProvidersProvider.notifier)
                      .updateLevel(newLevel);
                }),
          ],
        ),
      ),
    );
  }
}
