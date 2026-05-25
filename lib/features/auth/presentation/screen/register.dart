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


  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
 @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(height: 40.h),
                 Text(
                  "Let’s Get Started!",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                 SizedBox(height: 7.h),
                Text(
                  "Create an account on MNZL to get all features",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                 SizedBox(height: 45.h),
            
                // Username
                CustomTextField(
                  validator: Validators.username,
                  controller: usernameController,
                  hintText: 'User Name',
                  icon: Icons.person_outline,
                ),
                 SizedBox(height: 25.h),
            
                // Email
                CustomTextField(
                  validator: Validators.email,
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                 SizedBox(height: 25.h),
            
                // Password
                CustomTextField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validators.password,
                  controller: passwordController,
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility_off),
                ),
                 SizedBox(height: 40.h),
            
                // Create Button
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8EDDFF), Color(0xFF769DAD)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.r),
                      onTap: ()async {
                          if (_formkey.currentState!.validate()) {
                     await   context.read<AuthCubit>().register(
                          Signuprequest(
                            phone: "01207212392",
                            name: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                        Navigator.of(context).pushNamed(Login.routename);
                      }},
                      child: const Center(
                        child: Text(
                          "CREATE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
            
                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey[800]),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(Login.routename);
                      },
                      child:  Text(
                        "Login here",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF769DAD),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
