import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: .62,
      ),
      itemBuilder: (_, __) {
        return Shimmer.fromColors(
          period: const Duration(milliseconds: 2500),
          baseColor: const Color(0xffE7E7E7),
          highlightColor: const Color(0xffF5F5F5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// IMAGE
                Container(
                  height: 130.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 97, 95, 95),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(9.r),
                      topRight: Radius.circular(9.r),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Container(
                          height: 12.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 97, 95, 95),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),

                        SizedBox(height: 8.h),

                        /// SMALL TITLE
                        Container(
                          height: 10.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 97, 95, 95),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),

                        const Spacer(),

                        /// PRICE ROW
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 12.h,
                        //       width: 50.w,
                        //       decoration: BoxDecoration(
                        //     color: const Color.fromARGB(255, 97, 95, 95),
                        //         borderRadius: BorderRadius.circular(8.r),
                        //       ),
                        //     ),

                        //     SizedBox(width: 8.w),

                        //     Container(
                        //       height: 10.h,
                        //       width: 35.w,
                        //       decoration: BoxDecoration(
                        //        color: const Color.fromARGB(255, 97, 95, 95),
                        //         borderRadius: BorderRadius.circular(8.r),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        //   SizedBox(height: 12.h),

                        /// RATING
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 18.h,
                        //       width: 18.h,
                        //       decoration: BoxDecoration(
                        //         color: const Color.fromARGB(255, 97, 95, 95),
                        //         shape: BoxShape.circle,
                        //       ),
                        //     ),

                        //     SizedBox(width: 6.w),

                        //     Container(
                        //       height: 10.h,
                        //       width: 40.w,
                        //       decoration: BoxDecoration(
                        //          color: const Color.fromARGB(255, 97, 95, 95),
                        //         borderRadius: BorderRadius.circular(8.r),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
