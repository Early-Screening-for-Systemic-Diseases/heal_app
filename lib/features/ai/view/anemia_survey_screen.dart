import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service/service_locator.dart';
import '../data/model/anemia_survey_model.dart';
import '../viewmodel/prediction_cubit.dart';
import '../viewmodel/prediction_state.dart';
import 'text_prediction_screen.dart';

class AnemiaSurveyScreen extends StatefulWidget {
  const AnemiaSurveyScreen({Key? key}) : super(key: key);

  @override
  State<AnemiaSurveyScreen> createState() => _AnemiaSurveyScreenState();
}

class _AnemiaSurveyScreenState extends State<AnemiaSurveyScreen> {
  int _age = 25;
  int _gender = 2;
  int _ethnicity = 3;
  int _diabetes = 2;
  int _hypertension = 2;
  int _heartCondition = 2;
  int _asthma = 2;

  late final PredictionCubit _predictionCubit;

  @override
  void initState() {
    super.initState();
    _predictionCubit = getIt<PredictionCubit>();
  }

  void _submitForm() {
    final surveyData = AnemiaSurveyModel(
      age: _age,
      gender: _gender,
      ethnicity: _ethnicity,
      diabetes: _diabetes,
      hypertension: _hypertension,
      heartCondition: _heartCondition,
      asthma: _asthma,
    );
    _predictionCubit.predictAnemiaSurvey(surveyData.toJson());
  }

  void _showPredictionDialog(String prediction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.analytics, color: Colors.redAccent, size: 24),
            SizedBox(width: 8),
            Text('Analysis Result', style: TextStyle(fontSize: 18)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                prediction.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const TextPredictionScreen(filterDisease: 'anemia'),
                ),
              );
            },
            child: const Text('Continue', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  Widget _buildBinaryChoice(String label, int value, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => onChanged(2),
                style: ElevatedButton.styleFrom(
                  backgroundColor: value == 2 ? Colors.redAccent : Colors.grey[300],
                  foregroundColor: value == 2 ? Colors.white : Colors.black,
                ),
                child: const Text('No'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () => onChanged(1),
                style: ElevatedButton.styleFrom(
                  backgroundColor: value == 1 ? Colors.redAccent : Colors.grey[300],
                  foregroundColor: value == 1 ? Colors.white : Colors.black,
                ),
                child: const Text('Yes'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderChoice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('What is your biological sex?', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => setState(() => _gender = 1),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _gender == 1 ? Colors.redAccent : Colors.grey[300],
                  foregroundColor: _gender == 1 ? Colors.white : Colors.black,
                ),
                child: const Text('Male'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () => setState(() => _gender = 2),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _gender == 2 ? Colors.redAccent : Colors.grey[300],
                  foregroundColor: _gender == 2 ? Colors.white : Colors.black,
                ),
                child: const Text('Female'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _predictionCubit,
      child: BlocListener<PredictionCubit, PredictionState>(
        listener: (context, state) {
          if (state is PredictionSuccess && ModalRoute.of(context)?.isCurrent == true) {
            _showPredictionDialog(state.prediction);
          } else if (state is PredictionError && ModalRoute.of(context)?.isCurrent == true) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: ${state.message}')));
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Anemia Survey'), backgroundColor: Colors.redAccent),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Text(
                'Demographics',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 16),

              const Text('What is your age?', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: _age.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter age (1-120)',
                ),
                onChanged: (value) {
                  final age = int.tryParse(value);
                  if (age != null && age >= 1 && age <= 120) {
                    setState(() => _age = age);
                  }
                },
              ),
              const SizedBox(height: 16),

              _buildGenderChoice(),
              const SizedBox(height: 16),

              const Text(
                'Which group best describes your ethnicity?',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                value: _ethnicity,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                items: const [
                  DropdownMenuItem(value: 1, child: Text('Mexican American')),
                  DropdownMenuItem(value: 2, child: Text('Other Hispanic')),
                  DropdownMenuItem(value: 3, child: Text('Non-Hispanic White')),
                  DropdownMenuItem(value: 4, child: Text('Non-Hispanic Black')),
                  DropdownMenuItem(value: 5, child: Text('Other or Mixed')),
                ],
                onChanged: (value) => setState(() => _ethnicity = value!),
              ),
              const SizedBox(height: 24),

              const Text(
                'Medical History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 16),

              _buildBinaryChoice(
                'Have you ever been told by a doctor that you have diabetes?',
                _diabetes,
                (value) => setState(() => _diabetes = value),
              ),
              const SizedBox(height: 12),

              _buildBinaryChoice(
                'Have you ever been diagnosed with high blood pressure (hypertension)?',
                _hypertension,
                (value) => setState(() => _hypertension = value),
              ),
              const SizedBox(height: 12),

              _buildBinaryChoice(
                'Have you ever been diagnosed with a heart condition?',
                _heartCondition,
                (value) => setState(() => _heartCondition = value),
              ),
              const SizedBox(height: 12),

              _buildBinaryChoice(
                'Have you ever been diagnosed with asthma?',
                _asthma,
                (value) => setState(() => _asthma = value),
              ),
              const SizedBox(height: 32),

              BlocBuilder<PredictionCubit, PredictionState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is PredictionLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: state is PredictionLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Submit Survey', style: TextStyle(color: Colors.white)),
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
