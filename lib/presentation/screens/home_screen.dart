import 'package:desafio_adivina_el_numero/presentation/screens/game_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Adivina el numero')),
        actions: [Icon(Icons.menu)],
      ),
      body: GameScreen(),
    );
  }
}
