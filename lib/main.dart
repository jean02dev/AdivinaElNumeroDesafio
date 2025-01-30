import 'package:desafio_adivina_el_numero/config/theme/app.theme.dart';
import 'package:desafio_adivina_el_numero/presentation/providers/dark_mode_provider.dart';
import 'package:desafio_adivina_el_numero/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool darkMode = ref.watch(darkModeProviderProvider);

    return MaterialApp(
      title: 'Adivina el numero',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: darkMode).getTheme(),
      home: HomeScreen(),
    );
  }
}
