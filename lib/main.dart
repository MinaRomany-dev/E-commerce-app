import 'package:ecommerce2/core/routes/genearate_route.dart';
import 'package:ecommerce2/core/routes/routes.dart';
import 'package:ecommerce2/core/appobserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hkvdgfdjohgzajvndnwa.supabase.co',
    anonKey: 'sb_publishable_Cv3rMIuda3L04_tFQTi7hA_axXTFXXf',
  );
  Bloc.observer = AppBlocObserver();

  runApp(const Ecommerce());
}

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          onGenerateRoute: GenearateRoute.generateRoute,
    );
    }
      );
  }
  }

