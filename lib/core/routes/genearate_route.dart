import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/features/auth/presentation/screen/login.dart';
import 'package:ecommerce2/features/auth/presentation/screen/register.dart';

import 'package:ecommerce2/features/navbar/presentation/screens/home.dart';
import 'package:flutter/material.dart';

class GenearateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          settings: settings,
          builder:(context) => Home(),
        );
      case Routes.login:
        return MaterialPageRoute(builder: (context) => Login());
        case Routes.register:
        return MaterialPageRoute(builder: (context) => Register());

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
