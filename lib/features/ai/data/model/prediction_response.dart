class PredictionResponse {
  PredictionResponse({required this.prediction, required this.probability});

  final String prediction;
  final double probability;

  factory PredictionResponse.fromJson(Map<String, dynamic> json) {
    // Handle diabetes image API format
    if (json.containsKey('probability_non_diabetes')) {
      return PredictionResponse(
        prediction: json['prediction'] ?? '',
        probability: json['probability_non_diabetes'] ?? 0.0,
      );
    }
    // Handle anemia image API format
    else if (json.containsKey('anemia_status')) {
      return PredictionResponse(
        prediction: json['anemia_status'] ?? '',
        probability: json['hb_value'] ?? 0.0,
      );
    }
    // Handle anemia survey API format
    else if (json.containsKey('anemia_probability')) {
      final probability = json['anemia_probability'] ?? 0.0;
      final isAnemic = probability >= 0.5;
      return PredictionResponse(
        prediction: isAnemic ? 'anemic' : 'non-anemic',
        probability: probability,
      );
    }
    // Handle diabetes survey API format
    else {
      return PredictionResponse(
        prediction: json['diabetes'] ?? '',
        probability: json['probability'] ?? 0.0,
      );
    }
  }
}
