import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyFavScreen extends StatelessWidget {
  const EmptyFavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.heartDuotone.image(
              height: 60.h,
              width: 60.w,
              fit: BoxFit.contain,
            ),

            SizedBox(height: 18.h),

            Text(
              "No Saved Items!",
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(fontSize: 20.sp, color: Colors.black),
            ),

            SizedBox(height: 10.h),

            Text(
              "You don't have any saved items.\nGo to home and save some.",
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
