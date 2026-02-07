import 'package:flutter/material.dart';
import '../data/model/text_prediction_response.dart';
import 'upload_screen.dart';

class AnemiaDetailScreen extends StatelessWidget {
  final DiseaseDetail detail;

  const AnemiaDetailScreen({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anemia Details'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.redAccent, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(Icons.bloodtype, size: 60, color: Colors.white),
                const SizedBox(height: 12),
                const Text(
                  'ANEMIA',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Match: ${detail.percentage.toStringAsFixed(1)}%',
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            'Matched Symptoms',
            detail.matchedSymptoms.map((s) => '• $s').join('\n'),
            Icons.check_circle,
            Colors.redAccent,
          ),
          const SizedBox(height: 16),
          _buildSection(
            'What is Anemia?',
            'Anemia is a condition where you lack enough healthy red blood cells to carry adequate oxygen to your body\'s tissues.',
            Icons.info,
            Colors.redAccent,
          ),
          const SizedBox(height: 16),
          _buildSection(
            'Common Symptoms',
            '• Fatigue and weakness\n• Pale skin\n• Shortness of breath\n• Dizziness\n• Cold hands and feet',
            Icons.list,
            Colors.redAccent,
          ),
          const SizedBox(height: 16),
          _buildSection(
            'Recommendation',
            'Consult with a healthcare provider for proper diagnosis and treatment. Blood tests can confirm anemia.',
            Icons.medical_services,
            Colors.redAccent,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UploadScreen(
                      category: 'Anemia',
                      icon: '🩸',
                      color: Colors.redAccent,
                      sampleImagePath: 'assets/images/eye.webp',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Continue to Upload Image',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
