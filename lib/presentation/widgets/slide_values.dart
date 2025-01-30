import 'package:flutter/material.dart';

class SlideValues extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final int divisions;
  final String label;
  final ValueChanged<double> onChange;

  const SlideValues(
      {super.key,
      required this.value,
      required this.min,
      required this.max,
      required this.label,
      required this.onChange,
      required this.divisions});

  @override
  State<SlideValues> createState() => _SlideValuesState();
}

class _SlideValuesState extends State<SlideValues> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.value,
      min: widget.min,
      max: widget.max,
      divisions: widget.divisions,
      label: widget.label,
      onChanged: (double newValue) {
        widget.onChange(newValue);
      },
    );
  }
}
