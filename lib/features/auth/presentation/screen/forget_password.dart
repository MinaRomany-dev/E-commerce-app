import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/core/utils/toast.dart';
import 'package:ecommerce2/core/validator/validator.dart';
import 'package:ecommerce2/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce2/core/widgets/customtxtfield.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccess) {
                AppToast.showToast(
                  context: context,
                  title: "Success",
                  description: "Check your email",
                  type: ToastificationType.success,
                );
                Navigator.pushNamed(context, Routes.otp);
              } else if (state is ForgetPasswordError) {
                AppToast.showToast(
                  context: context,
                  title: "Error",
                  description: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Enter your email to reset password",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: heightScreen * 0.03),
                  Mytextfield(
                    isPassword: false,
                    controller: _emailController,
                    hintText: "xxxxx@example.com",
                    validator: Validators.email,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  // minaromanyfawzy@gmail.com
                  SizedBox(height: heightScreen * 0.03),
                  SizedBox(
                    height: heightScreen * 0.09,
                    width: double.infinity,
                    child: CustomElevatedButton(
                      isStadiumBorder: true,
                      //
                      // radius: 10.r,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().sendOtp(
                            _emailController.text.trim(),
                          );
                        }
                      },
                      backgroundColor: Colors.black,
                      child: Text(
                        "Request OTP",
                        style: TextStyle(fontSize: 16.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
