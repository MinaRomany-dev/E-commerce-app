import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/core/validator/validator.dart';
import 'package:ecommerce2/core/widgets/customtxtfield.dart';
import 'package:ecommerce2/features/auth/data/models/signup/signup_request.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:ecommerce2/features/auth/presentation/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  static const String routename = "/register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),

          child: Column(
            children: [
              SizedBox(height: 20.h),

              // HEADER
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 32.h),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(26.r),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.person_add_alt_1_rounded,
                      color: Colors.white,
                      size: 50.sp,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Join us and start shopping",
                      style: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.h),

              // FORM
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    // USERNAME
                    Mytextfield(
                      controller: usernameController,
                      validator: Validators.username,
                      hintText: "Username",
                      isPassword: false,
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // EMAIL
                    Mytextfield(
                      controller: emailController,
                      validator: Validators.email,
                      hintText: "Email",
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // PHONE
                    Mytextfield(
                      controller: phoneController,
                      hintText: "Phone Number",
                      isPassword: false,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone is required";
                        }
                        if (value.length < 11) {
                          return "Invalid phone number";
                        }
                        return null;
                      },
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // PASSWORD
                    Mytextfield(
                      controller: passwordController,
                      validator: Validators.password,
                      hintText: "Password",
                      isPassword: true,
                      obscureText: true,
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.grey),
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            await context.read<AuthCubit>().register(
                              Signuprequest(
                                name: usernameController.text.trim(),
                                email: emailController.text.trim(),
                                phone: phoneController.text.trim(),
                                password: passwordController.text,
                              ),
                            );

                            Navigator.of(
                              context,
                            ).pushReplacementNamed(Login.routename);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25.h),

              // LOGIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  SizedBox(width: 6.w),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(Login.routename);
                    },
                    child: Text(
                      "Login",
                      style: getBoldStyle(fontSize: 15.sp, color: Colors.black),
                    ),
                  ),
                ],
              ),

              //  SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
