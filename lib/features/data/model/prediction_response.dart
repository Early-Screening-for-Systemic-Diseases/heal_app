class PredictionResponse {
  PredictionResponse({required this.prediction, required this.probability});

  final String prediction;
  final double probability;

  factory PredictionResponse.fromJson(Map<String, dynamic> json) {
    // Handle image API format
    if (json.containsKey('probability_non_diabetes')) {
      return PredictionResponse(
        prediction: json['prediction'] ?? '',
        probability: json['probability_non_diabetes'] ?? 0.0,
      );
    }
    // Handle survey API format
    else {
      return PredictionResponse(
        prediction: json['diabetes'] ?? '',
        probability: json['probability'] ?? 0.0,
      );
    }
  }
}
