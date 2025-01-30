import 'dart:math';
import 'package:desafio_adivina_el_numero/entities/levels_enum.dart';

int generateNumber(Level level) {
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
