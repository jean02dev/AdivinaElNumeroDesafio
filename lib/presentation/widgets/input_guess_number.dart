import 'package:flutter/material.dart';

class InputGuessNumber extends StatefulWidget {
  final TextEditingController numberController;
  final String labelText;
  final ValueChanged<String> onSubmitted;

  const InputGuessNumber(
      {super.key,
      required this.numberController,
      required this.labelText,
      required this.onSubmitted});

  @override
  State<InputGuessNumber> createState() => _InputGuessNumberState();
}

class _InputGuessNumberState extends State<InputGuessNumber> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: TextField(
          controller: widget.numberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) {
            widget.onSubmitted(value);
          },
        ),
      ),
    );
  }
}
