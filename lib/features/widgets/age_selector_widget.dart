import 'package:flutter/material.dart';

class AgeSelectorWidget extends StatefulWidget {
  final int initialValue;
  final Function(int) onChanged;

  const AgeSelectorWidget({Key? key, required this.initialValue, required this.onChanged})
    : super(key: key);

  @override
  State<AgeSelectorWidget> createState() => _AgeSelectorWidgetState();
}

class _AgeSelectorWidgetState extends State<AgeSelectorWidget> {
  late int _value;

  final List<String> _ageRanges = [
    '18-24',
    '25-29',
    '30-34',
    '35-39',
    '40-44',
    '45-49',
    '50-54',
    '55-59',
    '60-64',
    '65-69',
    '70-74',
    '75-79',
    '80+',
  ];

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
        const Text('Age Range', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: _value,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          items: List.generate(13, (index) {
            return DropdownMenuItem(value: index + 1, child: Text(_ageRanges[index]));
          }),
          onChanged: (value) {
            if (value != null) {
              setState(() => _value = value);
              widget.onChanged(value);
            }
          },
        ),
      ],
    );
  }
}
