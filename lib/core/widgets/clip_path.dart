import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EdgedContainer extends StatelessWidget {
  const EdgedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SharpCurveClipper(),
      child: Container(
        height: 50.h,
        width: 220.w,
        decoration:
            BoxDecoration(color: Colors.blue.shade700, boxShadow: const [
          BoxShadow(
              color: Colors.white,
              offset: Offset(3, 1),
              blurRadius: 0,
              spreadRadius: 3),
        ]),
        child: Padding(
          padding: EdgeInsets.only(top: 18.h, left: 8.w),
          child: Text(
            'Hotels Search',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
          ),
        ),
      ),
    );
  }
}

class SharpCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * -0.0040000, size.height * 0.0100000);
    path.lineTo(0, size.height * 0.9900000);
    path.lineTo(size.width * 1.0040000, size.height * 1.0100000);
    path.lineTo(size.width * 0.6840000, size.height * -0.0100000);
    path.lineTo(size.width * -0.0040000, size.height * 0.0100000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
