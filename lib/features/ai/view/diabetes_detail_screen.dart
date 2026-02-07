import 'package:flutter/material.dart';
import '../data/model/text_prediction_response.dart';
import 'upload_screen.dart';

class DiabetesDetailScreen extends StatelessWidget {
  final DiseaseDetail detail;

  const DiabetesDetailScreen({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diabetes Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(Icons.water_drop, size: 60, color: Colors.white),
                const SizedBox(height: 12),
                const Text(
                  'DIABETES',
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
            Colors.blueAccent,
          ),
          const SizedBox(height: 16),
          _buildSection(
            'What is Diabetes?',
            'Diabetes is a chronic condition that affects how your body turns food into energy. It occurs when blood sugar levels are too high.',
            Icons.info,
            Colors.blueAccent,
          ),
          const SizedBox(height: 16),
          _buildSection(
            'Common Symptoms',
            '• Increased thirst\n• Frequent urination\n• Fatigue\n• Blurred vision\n• Slow-healing sores',
            Icons.list,
            Colors.blueAccent,
          ),
          const SizedBox(height: 16),
          _buildSection(
            'Recommendation',
            'Consult with a healthcare provider for proper diagnosis. Blood glucose tests can confirm diabetes.',
            Icons.medical_services,
            Colors.blueAccent,
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
                      category: 'Diabetes',
                      icon: '🔬',
                      color: Colors.blueAccent,
                      sampleImagePath: 'assets/images/tounge.png',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
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
