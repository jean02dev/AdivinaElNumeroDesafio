import 'package:desafio_adivina_el_numero/config/helpers/max_range_input.dart';
import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';

String? validateInput(String value, Level level) {
  final number = int.tryParse(value);
  final minRange = 1;
  final maxRange = maxRangeInput(level);

  if (number == null) {
    return 'Ingrese un valor valido';
  } else if (number < minRange || number > maxRange) {
    return 'Numero debe ser entre $minRange o $maxRange.';
  } else {
    return null;
  }
}
