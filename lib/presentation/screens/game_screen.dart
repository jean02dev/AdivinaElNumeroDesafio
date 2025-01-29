import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: Center(child: Text('Hola Mundo')))],
    );
  }
}
