import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// CART ITEMS
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(12.sp),
            itemCount: 4,
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: const Color(0xffE7E7E7),
                highlightColor: const Color(0xffF5F5F5),
                period: const Duration(milliseconds: 1800),
                child: Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// IMAGE
                      Container(
                        width: 90.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),

                      SizedBox(width: 14.w),

                      /// DETAILS
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// TITLE
                            Container(
                              height: 14.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),

                            SizedBox(height: 10.h),

                            /// SUB TITLE
                            Container(
                              height: 12.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),

                            SizedBox(height: 14.h),

                            /// PRICE
                            Container(
                              height: 14.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),

                            SizedBox(height: 18.h),

                            /// QUANTITY
                            Row(
                              children: [
                                Container(
                                  width: 28.w,
                                  height: 28.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                Container(
                                  width: 30.w,
                                  height: 12.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                Container(
                                  width: 28.w,
                                  height: 28.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
