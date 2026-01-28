class HealthDataModel {
  double bmi = 25.0;
  int highBP = 0;
  int highChol = 0;
  int cholCheck = 1;
  int smoker = 0;
  int physActivity = 1;
  int fruits = 1;
  int veggies = 1;
  int hvyAlcoholConsump = 0;
  int anyHealthcare = 1;
  int noDocbcCost = 0;
  int genHlth = 3;
  int mentHlth = 0;
  int physHlth = 0;
  int diffWalk = 0;
  int sex = 0;
  int age = 7;
  int education = 4;
  int income = 5;

  Map<String, dynamic> toJson() {
    return {
      'BMI': bmi,
      'HighBP': highBP,
      'HighChol': highChol,
      'CholCheck': cholCheck,
      'Smoker': smoker,
      'PhysActivity': physActivity,
      'Fruits': fruits,
      'Veggies': veggies,
      'HvyAlcoholConsump': hvyAlcoholConsump,
      'AnyHealthcare': anyHealthcare,
      'NoDocbcCost': noDocbcCost,
      'GenHlth': genHlth,
      'MentHlth': mentHlth,
      'PhysHlth': physHlth,
      'DiffWalk': diffWalk,
      'Sex': sex,
      'Age': age,
      'Education': education,
      'Income': income,
    };
  }

  void fromJson(Map<String, dynamic> json) {
    bmi = (json['BMI'] ?? 25.0).toDouble();
    highBP = json['HighBP'] ?? 0;
    highChol = json['HighChol'] ?? 0;
    cholCheck = json['CholCheck'] ?? 1;
    smoker = json['Smoker'] ?? 0;
    physActivity = json['PhysActivity'] ?? 1;
    fruits = json['Fruits'] ?? 1;
    veggies = json['Veggies'] ?? 1;
    hvyAlcoholConsump = json['HvyAlcoholConsump'] ?? 0;
    anyHealthcare = json['AnyHealthcare'] ?? 1;
    noDocbcCost = json['NoDocbcCost'] ?? 0;
    genHlth = json['GenHlth'] ?? 3;
    mentHlth = json['MentHlth'] ?? 0;
    physHlth = json['PhysHlth'] ?? 0;
    diffWalk = json['DiffWalk'] ?? 0;
    sex = json['Sex'] ?? 0;
    age = json['Age'] ?? 7;
    education = json['Education'] ?? 4;
    income = json['Income'] ?? 5;
  }
}
