import 'package:ecommerce2/core/di/service_locator.dart';
import 'package:ecommerce2/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();

  static Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.grey.shade200,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  static Widget _buildPriceRow({
    required String title,
    required String value,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 18 : 15,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 20 : 16,
            fontWeight: FontWeight.bold,
            color: isTotal ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }
}

class _CartScreenState extends State<CartScreen> {
  late final cartcubit;
  // @override
  //   void initState() {

  //     super.initState();
  //     cartcubit= context.read<CartCubit>();
  //   }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => servicelocator.get<CartCubit>()..getCart(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final cartItems = state.cartdata.products ;
              if (cartItems.isEmpty) {
                return Center(
                  child: Text(
                    'Cart is empty',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(12.sp),
                    itemCount: cartItems!.length,
                    separatorBuilder: (_, __) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 90.w,
                              height: 90.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                image: DecorationImage(
                                  image: NetworkImage(item.product.imageCover),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.product.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "\$${item.product.price}",
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 175, 76, 76),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      CartScreen._buildQuantityButton(
                                        icon: Icons.remove,
                                        onTap: () {},
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 14.w,
                                        ),
                                        child: Text(
                                          "${item.count}",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      CartScreen._buildQuantityButton(
                                        icon: Icons.add,
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                /// Bottom Summary
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 252, 252),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      CartScreen._buildPriceRow(
                        title: "Subtotal",
                        value: "\$${state.cartdata.totalCartPrice}",
                      ),
                      SizedBox(height: 10.h),
                      CartScreen._buildPriceRow(
                        title: "Shipping",
                        value: "\$10.00",
                      ),
                      Divider(height: 10.h),
                      CartScreen._buildPriceRow(
                        title: "Total",
                        value: "\$${(state.cartdata.totalCartPrice ?? 0) + 10}",
                        isTotal: true,
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is CartError) {
            return  Center(child: Text(state.message));
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
