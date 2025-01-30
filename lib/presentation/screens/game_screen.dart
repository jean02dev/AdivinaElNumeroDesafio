import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';
import 'package:desafio_adivina_el_numero/domain/providers/game_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameProvider = ref.watch(gameProvidersProvider);
    final currentLevel = ref.watch(gameProvidersProvider).level;
    final lowerNumbers = ref.watch(gameProvidersProvider).lowerNumbers;
    final levels = Level.values;
    final TextEditingController numberController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(child: Text('Número: ${gameProvider.targetNumber}')),
          Center(child: Text('Intentos: ${gameProvider.attempts}')),
          SizedBox(height: 20),
          Text('Nivel Actual', textAlign: TextAlign.center),
          SizedBox(height: 20),
          Slider(
            value: levels.indexOf(currentLevel).toDouble(),
            min: 0,
            max: levels.length - 1.toDouble(),
            divisions: levels.length - 1,
            label: currentLevel.toString().split('.').last,
            onChanged: (value) {
              final newLevel = levels[value.toInt()];
              ref.read(gameProvidersProvider.notifier).updateLevel(newLevel);
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Adivina un número',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                int guessedNumber = int.tryParse(value) ?? 0;
                ref
                    .read(gameProvidersProvider.notifier)
                    .guessNumber(guessedNumber);
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Mayor que'),
                      Expanded(
                        child: ListView.builder(
                          itemCount: gameProvider.lowerNumbers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              dense: true,
                              title: Center(
                                child: Text(gameProvider.lowerNumbers[index]
                                    .toString()),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Menor que'),
                      Expanded(
                        child: ListView.builder(
                          itemCount: gameProvider.higherNumbers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              dense: true,
                              title: Center(
                                child: Text(gameProvider.higherNumbers[index]
                                    .toString()),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Historial'),
                      Expanded(
                        child: ListView.builder(
                          itemCount: gameProvider.history.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  gameProvider.history[index].toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
