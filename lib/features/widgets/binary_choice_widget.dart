import 'package:flutter/material.dart';

class BinaryChoiceWidget extends StatefulWidget {
  final String label;
  final int initialValue;
  final Function(int) onChanged;
  final String yesLabel;
  final String noLabel;

  const BinaryChoiceWidget({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.yesLabel = 'Yes',
    this.noLabel = 'No',
  });

  @override
  State<BinaryChoiceWidget> createState() => _BinaryChoiceWidgetState();
}

class _BinaryChoiceWidgetState extends State<BinaryChoiceWidget> {
  late int _value;

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
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() => _value = 0);
                  widget.onChanged(0);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _value == 0 ? Colors.teal : Colors.grey[300],
                  foregroundColor: _value == 0 ? Colors.white : Colors.black,
                ),
                child: Text(widget.noLabel),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() => _value = 1);
                  widget.onChanged(1);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _value == 1 ? Colors.teal : Colors.grey[300],
                  foregroundColor: _value == 1 ? Colors.white : Colors.black,
                ),
                child: Text(widget.yesLabel),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
