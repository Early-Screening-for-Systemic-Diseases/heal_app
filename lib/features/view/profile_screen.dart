import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.blue.shade100,
              child: Icon(Icons.person, size: 50.sp, color: Colors.blue),
            ),
            SizedBox(height: 10.h),
            Text(
              'Hassan Sherif',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.h),
            Text(
              'Computer Science',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: Icon(Icons.email, size: 22.sp),
              title: Text('hassan@example.com', style: TextStyle(fontSize: 15.sp)),
            ),
            ListTile(
              leading: Icon(Icons.phone, size: 22.sp),
              title: Text('+20100455644', style: TextStyle(fontSize: 15.sp)),
            ),
            ListTile(
              leading: Icon(Icons.settings, size: 22.sp),
              title: Text('Settings', style: TextStyle(fontSize: 15.sp)),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
