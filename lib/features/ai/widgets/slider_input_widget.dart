import 'package:flutter/material.dart';

class SliderInputWidget extends StatefulWidget {
  final String label;
  final double min;
  final double max;
  final double initialValue;
  final Function(double) onChanged;

  const SliderInputWidget({
    Key? key,
    required this.label,
    required this.min,
    required this.max,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SliderInputWidget> createState() => _SliderInputWidgetState();
}

class _SliderInputWidgetState extends State<SliderInputWidget> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 16)),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: _value,
                min: widget.min,
                max: widget.max,
                divisions: (widget.max - widget.min).toInt(),
                label: _value.toInt().toString(),
                onChanged: (value) {
                  setState(() => _value = value);
                  widget.onChanged(value);
                },
              ),
            ),
            const SizedBox(width: 8),
            Text(
              _value.toInt().toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
