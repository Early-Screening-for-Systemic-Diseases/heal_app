import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/category_card.dart';
import '../widgets/gradient_button.dart';
import '../widgets/info_card.dart';

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
            Text('Welcome Back!', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h),
            Text('Monitor your health through AI analysis',
                style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.blue, Colors.purple]),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start New Analysis',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 4.h),
                  Text('Upload photos and get instant health insights',
                      style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
                  SizedBox(height: 10.h),
                  GradientButton(text: 'Begin Scan', onPressed: () {}),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text('Detection Categories',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.h),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              children: const [
                CategoryCard(icon: '💊', name: 'Vitamin Deficiency', color: Colors.greenAccent),
                CategoryCard(icon: '🩸', name: 'Anemia', color: Colors.redAccent),
                CategoryCard(icon: '🔬', name: 'Diabetes', color: Colors.blueAccent),
                CategoryCard(icon: '🦷', name: 'Oral Cancer', color: Colors.purpleAccent),
              ],
            ),
            SizedBox(height: 20.h),
            Text('Recent Scans', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.h),
            const InfoCard(
                title: 'Full Health Check',
                date: '2 days ago',
                status: 'Normal',
                color: Colors.green),
            const InfoCard(
                title: 'Vitamin Analysis',
                date: '5 days ago',
                status: 'Review',
                color: Colors.amber),
          ],
        ),
      ),
    );
  }
}
