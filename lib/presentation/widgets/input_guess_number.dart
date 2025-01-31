import 'package:desafio_adivina_el_numero/config/helpers/validate_input_number.dart';
import 'package:desafio_adivina_el_numero/domain/entities/levels_enum.dart';
import 'package:flutter/material.dart';

class InputGuessNumber extends StatefulWidget {
  final TextEditingController numberController;
  final Level level;
  final String labelText;
  final ValueChanged<String> onSubmitted;

  const InputGuessNumber(
      {super.key,
      required this.numberController,
      required this.labelText,
      required this.onSubmitted,
      required this.level});

  @override
  State<InputGuessNumber> createState() => _InputGuessNumberState();
}

class _InputGuessNumberState extends State<InputGuessNumber> {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            TextField(
              controller: widget.numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: widget.labelText,
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                setState(() {
                  errorMessage = validateInput(value, widget.level);
                });
                if (errorMessage == null) {
                  widget.onSubmitted(value);
                }
              },
            ),
            errorMessage != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
