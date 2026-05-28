import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.cartDuotone.image(
              height: 60.h,
              width: 60.w,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 10.h),

            Text(
              "Your Cart is Empty!",
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(fontSize: 20.sp, color: Colors.black),
            ),

            SizedBox(height: 10.h),

            Text(
              '''when you add items to it, they will
 appear here''',
              textAlign: TextAlign.center,
              style: getRegularStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
