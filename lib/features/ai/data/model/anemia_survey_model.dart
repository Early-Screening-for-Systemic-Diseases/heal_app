class AnemiaSurveyModel {
  final int age;
  final int gender;
  final int ethnicity;
  final int diabetes;
  final int hypertension;
  final int heartCondition;
  final int asthma;

  AnemiaSurveyModel({
    required this.age,
    required this.gender,
    required this.ethnicity,
    required this.diabetes,
    required this.hypertension,
    required this.heartCondition,
    required this.asthma,
  });

  Map<String, dynamic> toJson() {
    return {
      'RIDAGEYR': age,
      'RIAGENDR': gender,
      'RIDRETH1': ethnicity,
      'MCQ010': diabetes,
      'MCQ053': hypertension,
      'MCQ080': heartCondition,
      'MCQ160A': asthma,
    };
  }
}
