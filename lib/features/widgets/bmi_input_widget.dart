import 'package:flutter/material.dart';

class BMIInputWidget extends StatefulWidget {
  final double initialValue;
  final Function(double) onChanged;

  const BMIInputWidget({Key? key, required this.initialValue, required this.onChanged})
    : super(key: key);

  @override
  State<BMIInputWidget> createState() => _BMIInputWidgetState();
}

class _BMIInputWidgetState extends State<BMIInputWidget> {
  final TextEditingController _bmiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bmiController.text = widget.initialValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('BMI (Body Mass Index)', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        TextField(
          controller: _bmiController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter BMI (12-98)',
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            final bmi = double.tryParse(value);
            if (bmi != null) {
              widget.onChanged(bmi);
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _bmiController.dispose();
    super.dispose();
  }
}
