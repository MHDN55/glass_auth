import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_route_config.dart';
import 'injection_injectable_package.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: false,
          colorScheme: ColorScheme.dark(
            background: Colors.grey.shade900,
            primary: Colors.grey.shade600,
            secondary: const Color.fromARGB(255, 50, 50, 50),
            inversePrimary: Colors.grey.shade300,
            tertiary: Colors.black,
            tertiaryContainer: Colors.grey.shade800,
          ),
        ),
        routerConfig: MyAppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
