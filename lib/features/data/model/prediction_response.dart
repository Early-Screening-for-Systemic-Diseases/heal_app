class PredictionResponse {
  PredictionResponse({required this.prediction, required this.probabilityNonDiabetes});

  final String prediction;
  final double probabilityNonDiabetes;

  factory PredictionResponse.fromJson(Map<String, dynamic> json) {
    return PredictionResponse(
      prediction: json['prediction'] ?? '',
      probabilityNonDiabetes: json['probability_non_diabetes'] ?? 0.0,
    );
  }
}
