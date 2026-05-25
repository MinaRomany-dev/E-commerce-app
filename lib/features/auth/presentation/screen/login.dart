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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toastification/toastification.dart';

class Login extends StatelessWidget {
  static const String routename = "/login";
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginError) {
          Fluttertoast.showToast(
            msg: state.message,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }

        if (state is LoginSuccess) {
        AppToast.showToast(
          
          context: context,
          title: "Success",
          description: "Login Successfully",
          type: ToastificationType.success,
        );
        Navigator.of(context).pushNamed(Routes.home);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 180),
                      Image.asset("assets/images/lol.png"),
                      SizedBox(height: 60),

                      Text(
                        "Welcome back!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 15),
                      Text("Log in to existing LOGO account"),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 37,
                          vertical: 50,
                        ),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'enter your email',
                              validator: Validators.email,
                              controller: _emailController,
                            ),

                            SizedBox(height: 25),

                            CustomTextField(
                              controller: _passwordcontroller,
                              hintText: 'enter your password',
                              validator: Validators.password,
                            ),

                            SizedBox(height: 15),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),

                            SizedBox(height: 25),
                            SizedBox(
                              width: 120.w,
                              height: 60.h,
                              child: ElevatedButton(
                                onPressed: state is LoginLoading
                                    ? null
                                    : ()async {
                                        if (_formKey.currentState!.validate()) {
                                     await  context.read<AuthCubit>().Login(
                                            Signinrequest(
                                              email: _emailController.text,
                                              password:
                                                  _passwordcontroller.text,
                                            ),
                                          );
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 5,
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF8EDDFF),
                                        Color(0xFF769DAD),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Center(
                                    child: state is LoginLoading
                                        ? SizedBox(
                                            height: 10.h,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            //  strokeWidth: 2,
                                            ),
                                          )
                                        : const Text(
                                            "Log in",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Text('Or sign in using'),

                      SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(Routes.register);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 50,
              top: 0,
              child: Image.asset('assets/images/Rectangle12.png'),
            ),

            Positioned(
              left: 0,
              top: 0,
              child: Image.asset('assets/images/Rectangle_11.png'),
            ),
          ],
        );
      },
    );
  }
}
