class DiabetesRecord {
  final String imageUrl;
  final String prediction;
  final double probabilityNonDiabetes;
  final DateTime timestamp;

  const DiabetesRecord({
    required this.imageUrl,
    required this.prediction,
    required this.probabilityNonDiabetes,
    required this.timestamp,
  });

  factory DiabetesRecord.fromJson(Map<String, dynamic> json) {
    return DiabetesRecord(
      imageUrl: json['imageUrl'] ?? '',
      prediction: json['prediction'] ?? '',
      probabilityNonDiabetes: (json['probabilityNonDiabetes'] ?? 0.0).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'prediction': prediction,
      'probabilityNonDiabetes': probabilityNonDiabetes,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class AnemiaRecord {
  final String imageUrl;
  final String anemiaStatus;
  final double hbValue;
  final DateTime timestamp;

  const AnemiaRecord({
    required this.imageUrl,
    required this.anemiaStatus,
    required this.hbValue,
    required this.timestamp,
  });

  factory AnemiaRecord.fromJson(Map<String, dynamic> json) {
    return AnemiaRecord(
      imageUrl: json['imageUrl'] ?? '',
      anemiaStatus: json['anemiaStatus'] ?? '',
      hbValue: (json['hbValue'] ?? 0.0).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'anemiaStatus': anemiaStatus,
      'hbValue': hbValue,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class DiabetesSurvey {
  final String diabetes;
  final double probability;
  final DateTime timestamp;
  final Map<String, dynamic> surveyData;

  const DiabetesSurvey({
    required this.diabetes,
    required this.probability,
    required this.timestamp,
    required this.surveyData,
  });

  factory DiabetesSurvey.fromJson(Map<String, dynamic> json) {
    return DiabetesSurvey(
      diabetes: json['diabetes'] ?? '',
      probability: (json['probability'] ?? 0.0).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
      surveyData: Map<String, dynamic>.from(json['surveyData'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diabetes': diabetes,
      'probability': probability,
      'timestamp': timestamp.toIso8601String(),
      'surveyData': surveyData,
    };
  }
}

class AnemiaSurvey {
  final String prediction;
  final double anemiaProbability;
  final DateTime timestamp;
  final Map<String, dynamic> surveyData;

  const AnemiaSurvey({
    required this.prediction,
    required this.anemiaProbability,
    required this.timestamp,
    required this.surveyData,
  });

  factory AnemiaSurvey.fromJson(Map<String, dynamic> json) {
    return AnemiaSurvey(
      prediction: json['prediction'] ?? '',
      anemiaProbability: (json['anemiaProbability'] ?? 0.0).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
      surveyData: Map<String, dynamic>.from(json['surveyData'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prediction': prediction,
      'anemiaProbability': anemiaProbability,
      'timestamp': timestamp.toIso8601String(),
      'surveyData': surveyData,
    };
  }
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final List<DiabetesRecord> diabetesRecords;
  final List<AnemiaRecord> anemiaRecords;
  final List<DiabetesSurvey> diabetesSurveys;
  final List<AnemiaSurvey> anemiaSurveys;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.diabetesRecords = const [],
    this.anemiaRecords = const [],
    this.diabetesSurveys = const [],
    this.anemiaSurveys = const [],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      diabetesRecords: (json['diabetesRecords'] as List<dynamic>?)
          ?.map((e) => DiabetesRecord.fromJson(e))
          .toList() ?? [],
      anemiaRecords: (json['anemiaRecords'] as List<dynamic>?)
          ?.map((e) => AnemiaRecord.fromJson(e))
          .toList() ?? [],
      diabetesSurveys: (json['diabetesSurveys'] as List<dynamic>?)
          ?.map((e) => DiabetesSurvey.fromJson(e))
          .toList() ?? [],
      anemiaSurveys: (json['anemiaSurveys'] as List<dynamic>?)
          ?.map((e) => AnemiaSurvey.fromJson(e))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'diabetesRecords': diabetesRecords.map((e) => e.toJson()).toList(),
      'anemiaRecords': anemiaRecords.map((e) => e.toJson()).toList(),
      'diabetesSurveys': diabetesSurveys.map((e) => e.toJson()).toList(),
      'anemiaSurveys': anemiaSurveys.map((e) => e.toJson()).toList(),
    };
  }
}
