import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/guidance_data.dart';

class GuidanceDetailScreen extends StatelessWidget {
  final String type;

  const GuidanceDetailScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final guidance = type == 'anemia' ? GuidanceData.anemiaGuidance : GuidanceData.diabetesGuidance;
    final color = type == 'anemia' ? const Color(0xFFE53935) : const Color(0xFF1E88E5);

    return Scaffold(
      appBar: AppBar(
        title: Text(guidance['title']!),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Diet & Nutrition', guidance['diet']!, Icons.restaurant, color),
            SizedBox(height: 20.h),
            _buildSection('Self-Care & Lifestyle', guidance['lifestyle']!, Icons.favorite, color),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(content, style: TextStyle(fontSize: 14.sp, height: 1.5)),
        ],
      ),
    );
  }
}
