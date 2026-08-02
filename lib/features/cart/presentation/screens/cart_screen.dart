import 'package:ecommerce2/core/utils/toast.dart';
import 'package:ecommerce2/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce2/features/cart/presentation/screens/widgets/cart_item.dart';
import 'package:ecommerce2/features/cart/presentation/screens/widgets/default_cart_screens.dart';
import 'package:ecommerce2/features/cart/presentation/screens/widgets/shimmer_cart_screen.dart';
import 'package:ecommerce2/features/payment/presentation/cubit/checkout_cubit.dart';
import 'package:ecommerce2/features/payment/presentation/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();

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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartError) {
          return Center(child: Text(state.message));
        } else if (state is CartLoading) {
          return const CartShimmer();
        } else if (state is CartLoaded) {
          final cart = state.cartdata;
          final cartItems = cart.products;
          if (cartItems.isEmpty) {
            return EmptyCartScreen();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(12.sp),
                  itemCount: cartItems.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return CartItemWidget(
                      key: ValueKey(item.product.id),
                      onDecrement: () async {
                        await context.read<CartCubit>().updateQuantity(
                          item.count - 1,
                          item.product.id,
                        );
                      },
                      onIncrement: () => context
                          .read<CartCubit>()
                          .updateQuantity(item.count + 1, item.product.id),
                      onDelete: () => context.read<CartCubit>().removeFromCart(
                        item.product.id,
                      ),
                      item: item,
                    );
                  },
                ),
              ),

              /// Bottom Summary
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    ),
                  ],
                  color: const Color.fromARGB(255, 255, 252, 252),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.r),
                  ),
                ),
                child: Column(
                  children: [
                    CartScreen._buildPriceRow(
                      title: "Subtotal",
                      value: "\$ ${cart.totalCartPrice}",
                    ),
                    SizedBox(height: 10.h),
                    CartScreen._buildPriceRow(
                      title: "Shipping",
                      value: "\$ 10.00",
                    ),
                    Divider(height: 10.h),
                    CartScreen._buildPriceRow(
                      title: "Total",
                      value: "\$ ${(cart.totalCartPrice) + 10}",
                      isTotal: true,
                    ),
                    SizedBox(height: 5.h),
                    BlocListener<CheckoutCubit, CheckoutState>(
                      listener: (context, state) {
                        if (state is CheckoutError) {
                          AppToast.showToast(
                            context: context,
                            title: 'Failed',
                            description: state.message,
                            type: ToastificationType.custom(
                              'failed',
                              Colors.red,
                              Icons.error,
                            ),
                          );
                        }
                        if (state is CheckoutSuccess) {
                          final checkoutUrl = state.paymentEntity.session.url;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaymentWebView(url: checkoutUrl),
                            ),
                          );
                        }
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            context.read<CheckoutCubit>().addCheckout(cart.id);
                          },
                          child: const Text(
                            "Pay Now",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
