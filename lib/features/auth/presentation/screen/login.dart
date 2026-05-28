// import 'package:ecommerce2/core/routes/routes.dart';
// import 'package:ecommerce2/core/utils/toast.dart';
// import 'package:ecommerce2/core/validator/validator.dart';
// import 'package:ecommerce2/core/widgets/customtxtfield.dart';
// import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
// import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart';
// import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_state.dart';
// import 'package:ecommerce2/gen/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:toastification/toastification.dart';

// class Login extends StatelessWidget {
//   static const String routename = "/login";
//   final _emailController = TextEditingController();
//   final _passwordcontroller = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthCubit, AuthState>(
//       listener: (context, state) {
//         if (state is LoginError) {
//           AppToast.showToast(
//             context: context,
//             title: "Error",
//             description: state.message,
//             type: ToastificationType.error,
//           );
//         }

//         if (state is LoginSuccess) {
//           AppToast.showToast(
//             context: context,
//             title: "Success",
//             description: "Login Successfully",
//             type: ToastificationType.success,
//           );
//           Navigator.of(context).pushNamed(Routes.home);
//         }
//       },
//       builder: (context, state) {
//         return Stack(
//           children: [
//             Scaffold(
//               resizeToAvoidBottomInset: true,
//               body: SafeArea(
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(height: 150.h),

//                         SizedBox(height: 50.h),

//                         Text(
//                           "Welcome back!",
//                           style: TextStyle(
//                             fontSize: 26.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),

//                         SizedBox(height: 13.h),
//                         Text("Log in to existing LOGO account"),

//                         Padding(
//                           padding:  EdgeInsets.symmetric(
//                             horizontal: 25.w,
//                             vertical: 40.h,
//                           ),
//                           child: Column(
//                             children: [
//                               CustomTextField(
//                                 hintText: 'enter your email',
//                                 validator: Validators.email,
//                                 controller: _emailController,
//                               ),

//                               SizedBox(height: 20.h),

//                               CustomTextField(
//                                 controller: _passwordcontroller,
//                                 hintText: 'enter your password',
//                                 validator: Validators.password,
//                               ),

//                               SizedBox(height: 15.h),

//                               Align(
//                                 alignment: Alignment.centerRight,
//                                 child: Text(
//                                   "Forgot Password?",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),

//                               SizedBox(height: 10.h),
//                               SizedBox(
//                              width: double.infinity,
//                                 height: 50.h,
//                                 child: ElevatedButton(
//                                   onPressed: state is LoginLoading
//                                       ? null
//                                       : () async {
//                                           if (_formKey.currentState!.validate()) {
//                                             await context.read<AuthCubit>().Login(
//                                               Signinrequest(
//                                                 email: _emailController.text,
//                                                 password:
//                                                     _passwordcontroller.text,
//                                               ),
//                                             );
//                                           }
//                                         },
//                                   style: ElevatedButton.styleFrom(
//                                     padding: EdgeInsets.zero,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10.r),
//                                     ),
//                                     backgroundColor: Colors.transparent,
//                                     elevation: 5,
//                                   ),
//                                   child: Ink(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       gradient: const LinearGradient(
//                                         colors: [
//                                         Colors.black,
//                                          // Color(0xFF8EDDFF),
//                                           Color(0xFF769DAD),
//                                         ],
//                                         begin: Alignment.topCenter,
//                                         end: Alignment.bottomCenter,
//                                       ),
//                                     ),
//                                     child: Center(
//                                       child: state is LoginLoading
//                                           ? SizedBox(
//                                               height: 10.h,
//                                               child: CircularProgressIndicator(
//                                                 color: Colors.white,
//                                                 //  strokeWidth: 2,
//                                               ),
//                                             )
//                                           :  Text(
//                                               "Log in",
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 20.sp,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text("Don't have an account?"),
//                             SizedBox(width: 5.w),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(
//                                   context,
//                                 ).pushReplacementNamed(Routes.register);
//                               },
//                               child: Text(
//                                 "Sign Up",
//                                 style: TextStyle(
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             Positioned(
//               left: 40.w,
//               top: 0,
//               child: Image.asset('assets/images/Rectangle12.png'),
//             ),

//             Positioned(
//               left: 0,
//               top: 0,
//               child: Image.asset('assets/images/Rectangle_11.png'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:ecommerce2/core/resources/styles_manager.dart';
import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/core/utils/toast.dart';
import 'package:ecommerce2/core/validator/validator.dart';
import 'package:ecommerce2/core/widgets/customtxtfield.dart';
import 'package:ecommerce2/features/auth/data/models/signin/sigin_request.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:ecommerce2/features/auth/presentation/cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class Login extends StatelessWidget {
  Login({super.key});

  static const String routename = "/login";

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginError) {
          AppToast.showToast(
            context: context,
            title: "Error",
            description: state.message,
            type: ToastificationType.error,
          );
        }

        if (state is LoginSuccess) {
          AppToast.showToast(
            context: context,
            title: "Success",
            description: "Login Successfully",
            type: ToastificationType.success,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,

          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 30.w),

              child: SizedBox(
                height:
                    MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,

                child: Column(
                  children: [
                    SizedBox(height: 30.h),

                    // TOP HEADER
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 25.h),

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(28.r),
                      ),

                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 55.sp,
                          ),

                          SizedBox(height: 14.h),

                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -1,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            "Login to continue shopping",
                            style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 45.h),

                    // FORM
                    Form(
                      key: _formKey,

                      child: Column(
                        children: [
                          Mytextfield(
                            isPassword: false,
                            controller: _emailController,
                            hintText: "Enter your email",
                            validator: Validators.email,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          SizedBox(height: 22.h),

                          Mytextfield(
                            isPassword: true,
                            controller: _passwordController,
                            hintText: "Enter your password",
                            validator: Validators.password,
                            obscureText: true,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          SizedBox(height: 16.h),

                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                // Navigator.pushNamed(
                                //   context,
                                //   Routes.forgotpassword,
                                // );
                              },

                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 30.h),

                          // LOGIN BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 58.h,

                            child: ElevatedButton(
                              onPressed: state is LoginLoading
                                  ? null
                                  : () async {
                                      if (_formKey.currentState!.validate()) {
                                        await context.read<AuthCubit>().Login(
                                          Signinrequest(
                                            email: _emailController.text.trim(),
                                            password: _passwordController.text,
                                          ),
                                        );
                                        Navigator.of(
                                          context,
                                        ).pushReplacementNamed(Routes.home);
                                      }
                                    },

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                elevation: 0,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.r),
                                ),
                              ),

                              child: state is LoginLoading
                                  ? SizedBox(
                                      height: 22.h,
                                      width: 22.w,

                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      "Log In",
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

                    SizedBox(height: 30.h),
                    //  const Spacer(),

                    // SIGN UP
                    Padding(
                      padding: EdgeInsets.only(bottom: 25.h),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14.sp,
                            ),
                          ),

                          SizedBox(width: 6.w),

                          InkWell(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(Routes.register);
                            },

                            child: Text(
                              "Sign Up",
                              style: getBoldStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
