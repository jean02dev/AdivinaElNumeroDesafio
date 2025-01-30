import 'package:desafio_adivina_el_numero/presentation/providers/dark_mode_provider.dart';
import 'package:desafio_adivina_el_numero/presentation/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Adivina un número')),
        actions: [
          IconButton(
              onPressed: () =>
                  ref.read(darkModeProviderProvider.notifier).toggleDarkMode(),
              icon: Icon(Icons.menu))
        ],
      ),
      body: GameScreen(),
    );
  }
}
