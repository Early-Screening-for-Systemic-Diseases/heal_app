import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VektuLogoWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const VektuLogoWidget({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/vektu_logo.png',
      height: height ?? 54.h,
      width: width ?? 118.w,
      fit: BoxFit.contain,
    );
  }
}