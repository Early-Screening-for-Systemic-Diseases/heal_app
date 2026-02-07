import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/service/service_locator.dart';
import '../data/model/health_data_model.dart';
import '../viewmodel/prediction_cubit.dart';
import '../viewmodel/prediction_state.dart';
import '../widgets/age_selector_widget.dart';
import '../widgets/binary_choice_widget.dart';
import '../widgets/bmi_input_widget.dart';
import '../widgets/education_selector.dart';
import '../widgets/income_selector.dart';
import '../widgets/slider_input_widget.dart';
import 'text_prediction_screen.dart';

class HealthSurveyScreen extends StatefulWidget {
  const HealthSurveyScreen({Key? key}) : super(key: key);

  @override
  State<HealthSurveyScreen> createState() => _HealthSurveyScreenState();
}

class _HealthSurveyScreenState extends State<HealthSurveyScreen> {
  final HealthDataModel _healthData = HealthDataModel();
  late final PredictionCubit _predictionCubit;

  @override
  void initState() {
    super.initState();
    _predictionCubit = getIt<PredictionCubit>();
  }

  void _submitForm() {
    _predictionCubit.predictHealthData(_healthData);
  }

  void _showPredictionDialog(String prediction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.analytics, color: Colors.blueAccent, size: 24),
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
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Diabetic: ${prediction.toUpperCase()}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
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
                  builder: (context) => const TextPredictionScreen(filterDisease: 'diabetes'),
                ),
              );
            },
            child: const Text('Continue', style: TextStyle(color: Colors.blueAccent)),
          ),
        ],
      ),
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
          appBar: AppBar(title: const Text('Health Survey'), backgroundColor: Colors.teal),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Text(
                'Body Measurements',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              BMIInputWidget(
                initialValue: _healthData.bmi,
                onChanged: (value) => _healthData.bmi = value,
              ),
              const SizedBox(height: 24),

              const Text(
                'Medical History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              BinaryChoiceWidget(
                label: 'High Blood Pressure',
                initialValue: _healthData.highBP,
                onChanged: (value) => _healthData.highBP = value,
              ),
              const SizedBox(height: 12),

              BinaryChoiceWidget(
                label: 'High Cholesterol',
                initialValue: _healthData.highChol,
                onChanged: (value) => _healthData.highChol = value,
              ),
              const SizedBox(height: 12),

              BinaryChoiceWidget(
                label: 'Cholesterol Check (past 5 years)',
                initialValue: _healthData.cholCheck,
                onChanged: (value) => _healthData.cholCheck = value,
              ),
              const SizedBox(height: 24),

              const Text('Lifestyle', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              BinaryChoiceWidget(
                label: 'Smoker (100+ cigarettes lifetime)',
                initialValue: _healthData.smoker,
                onChanged: (value) => _healthData.smoker = value,
              ),
              const SizedBox(height: 12),

              BinaryChoiceWidget(
                label: 'Physical Activity (past 30 days)',
                initialValue: _healthData.physActivity,
                onChanged: (value) => _healthData.physActivity = value,
              ),
              const SizedBox(height: 12),

              BinaryChoiceWidget(
                label: 'Eat Fruits Daily',
                initialValue: _healthData.fruits,
                onChanged: (value) => _healthData.fruits = value,
              ),
              const SizedBox(height: 12),

              BinaryChoiceWidget(
                label: 'Eat Vegetables Daily',
                initialValue: _healthData.veggies,
                onChanged: (value) => _healthData.veggies = value,
              ),
              const SizedBox(height: 12),

              BinaryChoiceWidget(
                label: 'Heavy Alcohol Consumption',
                initialValue: _healthData.hvyAlcoholConsump,
                onChanged: (value) => _healthData.hvyAlcoholConsump = value,
              ),
              const SizedBox(height: 24),

              const Text(
                'Healthcare Access',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              BinaryChoiceWidget(
                label: 'Have Healthcare Coverage',
                initialValue: _healthData.anyHealthcare,
                onChanged: (value) => _healthData.anyHealthcare = value,
              ),
              const SizedBox(height: 12),

              BinaryChoiceWidget(
                label: 'Could Not See Doctor (cost)',
                initialValue: _healthData.noDocbcCost,
                onChanged: (value) => _healthData.noDocbcCost = value,
              ),
              const SizedBox(height: 24),

              const Text(
                'Health Status',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              SliderInputWidget(
                label: 'General Health (1=Excellent, 5=Poor)',
                min: 1,
                max: 5,
                initialValue: _healthData.genHlth.toDouble(),
                onChanged: (value) => _healthData.genHlth = value.toInt(),
              ),
              const SizedBox(height: 16),

              SliderInputWidget(
                label: 'Mental Health (bad days in past 30)',
                min: 0,
                max: 30,
                initialValue: _healthData.mentHlth.toDouble(),
                onChanged: (value) => _healthData.mentHlth = value.toInt(),
              ),
              const SizedBox(height: 16),

              SliderInputWidget(
                label: 'Physical Health (bad days in past 30)',
                min: 0,
                max: 30,
                initialValue: _healthData.physHlth.toDouble(),
                onChanged: (value) => _healthData.physHlth = value.toInt(),
              ),
              const SizedBox(height: 12),

              BinaryChoiceWidget(
                label: 'Difficulty Walking or Climbing Stairs',
                initialValue: _healthData.diffWalk,
                onChanged: (value) => _healthData.diffWalk = value,
              ),
              const SizedBox(height: 24),

              const Text(
                'Demographics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              BinaryChoiceWidget(
                label: 'Sex',
                yesLabel: 'Male',
                noLabel: 'Female',
                initialValue: _healthData.sex,
                onChanged: (value) => _healthData.sex = value,
              ),
              const SizedBox(height: 16),

              AgeSelectorWidget(
                initialValue: _healthData.age,
                onChanged: (value) => _healthData.age = value,
              ),
              const SizedBox(height: 16),

              EducationSelectorWidget(
                initialValue: _healthData.education,
                onChanged: (value) => _healthData.education = value,
              ),
              const SizedBox(height: 16),

              IncomeSelectorWidget(
                initialValue: _healthData.income,
                onChanged: (value) => _healthData.income = value,
              ),
              const SizedBox(height: 32),

              BlocBuilder<PredictionCubit, PredictionState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is PredictionLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
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
