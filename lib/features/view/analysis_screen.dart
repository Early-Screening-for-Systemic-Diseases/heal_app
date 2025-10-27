import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Analyses', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: ListTile(
                    leading: Icon(Icons.analytics, size: 28.sp, color: Colors.blue),
                    title: Text('Analysis #${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp)),
                    subtitle: Text('Result: Pending', style: TextStyle(fontSize: 13.sp)),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
