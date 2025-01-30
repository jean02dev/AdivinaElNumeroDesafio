import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';

int attemptsForLevel(Level level) {
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
