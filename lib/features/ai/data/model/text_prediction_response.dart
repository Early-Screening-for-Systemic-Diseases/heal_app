class TextPredictionResponse {
  final String text;
  final bool lexiconMatched;
  final List<DiseaseResult> results;
  final Map<String, DiseaseDetail> resultsMap;

  TextPredictionResponse({
    required this.text,
    required this.lexiconMatched,
    required this.results,
    required this.resultsMap,
  });

  factory TextPredictionResponse.fromJson(Map<String, dynamic> json) {
    return TextPredictionResponse(
      text: json['text'] ?? '',
      lexiconMatched: json['lexicon_matched'] ?? false,
      results: (json['results'] as List?)
              ?.map((e) => DiseaseResult.fromJson(e))
              .toList() ??
          [],
      resultsMap: (json['results_map'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, DiseaseDetail.fromJson(value)),
          ) ??
          {},
    );
  }
}

class DiseaseResult {
  final String disease;
  final List<String> matchedSymptoms;
  final double percentage;

  DiseaseResult({
    required this.disease,
    required this.matchedSymptoms,
    required this.percentage,
  });

  factory DiseaseResult.fromJson(Map<String, dynamic> json) {
    return DiseaseResult(
      disease: json['disease'] ?? '',
      matchedSymptoms: List<String>.from(json['matched_symptoms'] ?? []),
      percentage: (json['percentage'] ?? 0.0).toDouble(),
    );
  }
}

class DiseaseDetail {
  final double percentage;
  final List<String> matchedSymptoms;

  DiseaseDetail({
    required this.percentage,
    required this.matchedSymptoms,
  });

  factory DiseaseDetail.fromJson(Map<String, dynamic> json) {
    return DiseaseDetail(
      percentage: (json['percentage'] ?? 0.0).toDouble(),
      matchedSymptoms: List<String>.from(json['matched_symptoms'] ?? []),
    );
  }
}
