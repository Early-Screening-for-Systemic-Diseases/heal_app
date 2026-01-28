import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/category_card.dart';
import '../widgets/info_card.dart';
import 'survey_screen.dart';
import 'upload_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.h),
            Text(
              'Monitor your health through AI analysis',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            SizedBox(height: 20.h),

            // Info Card instead of gradient button
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AI Health Analysis',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Select a category below to start your health scan',
                          style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.health_and_safety, size: 50.sp, color: Colors.white70),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            Text(
              'Detection Categories',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),

            // Two category cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
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
                  child: const CategoryCard(icon: '🩸', name: 'Anemia', color: Colors.redAccent),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HealthSurveyScreen()),
                    );
                  },
                  child: const CategoryCard(icon: '🔬', name: 'Diabetes', color: Colors.blueAccent),
                ),
              ],
            ),

            SizedBox(height: 30.h),
            Text(
              'Recent Scans',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),
            const InfoCard(
              title: 'Anemia Check',
              date: '2 days ago',
              status: 'Normal',
              color: Colors.green,
            ),
            const InfoCard(
              title: 'Diabetes Analysis',
              date: '5 days ago',
              status: 'Review',
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
