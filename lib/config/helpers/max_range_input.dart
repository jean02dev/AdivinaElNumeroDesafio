import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';

int maxRangeInput(Level level) {
  switch (level) {
    case Level.facil:
      return 10;
    case Level.medio:
      return 20;
    case Level.avanzado:
      return 100;
    case Level.extremo:
      return 1000;
  }
}
