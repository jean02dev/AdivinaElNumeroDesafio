import 'package:desafio_adivina_el_numero/domain/providers/game_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameProvider = ref.watch(gameProvidersProvider);

    return Column(
      children: [
        Expanded(
            child: Center(child: Text('Intentos: ${gameProvider.attempts}')))
      ],
    );
  }
}
