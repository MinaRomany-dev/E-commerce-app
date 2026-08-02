import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/features/auth/presentation/screen/forget_password.dart';
import 'package:ecommerce2/features/auth/presentation/screen/login.dart';
import 'package:ecommerce2/features/auth/presentation/screen/otp_screens.dart';
import 'package:ecommerce2/features/auth/presentation/screen/register.dart';
import 'package:ecommerce2/features/auth/presentation/screen/reset_password.dart';
import 'package:ecommerce2/features/home/presentation/screens/home.dart';
import 'package:ecommerce2/features/payment/presentation/screens/checkout_screen.dart';
import 'package:ecommerce2/features/product_deatils/presentation/widgets/details_product.dart';
import 'package:ecommerce2/splash_screen.dart';
import 'package:flutter/material.dart';

class GenearateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Home(),
        );
      case Routes.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => SplashScreen(),
        );
      case Routes.forgetpassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ForgetPassword(),
        );
      case Routes.resetpassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ResetPasswordScreen(),
        );
      case Routes.otp:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PinputExample(),
        );
      case Routes.login:
        return MaterialPageRoute(builder: (context) => Login());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => Register());
      case Routes.details:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DetailsProduct(),
        );
      case Routes.checkout:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) =>
              PaymentWebView(url: settings.arguments as String),
        );
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('No Route Found')),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
