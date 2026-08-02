import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/core/utils/toast.dart';
import 'package:ecommerce2/core/validator/validator.dart';
import 'package:ecommerce2/core/widgets/customtxtfield.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    Navigator.of(
                      context,
                    ).pushNamedAndRemoveUntil(Routes.login, (route) => false);
                  } else if (state is ResetPasswordError) {
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
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),

                    Text(
                      '''Set Your New Password on Your
               Email''',
                      style: getSemiBoldStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Mytextfield(
                      isPassword: false,
                      icon: Icons.email_outlined,
                      controller: _emailController,
                      hintText: " Your Email",
                      validator: Validators.email,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: 22.h),

                    Mytextfield(
                      icon: Icons.lock_outline,
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey.shade600,
                      ),
                      isPassword: false,

                      controller: _passwordController,
                      hintText: " New Password",
                      validator: Validators.password,
                      obscureText: true,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,

                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await context.read<AuthCubit>().reset(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                        ),

                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
