import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';
import 'package:tiktok_clone/screens/root/root_binding.dart';
import 'package:tiktok_clone/widget/loading/loading.dart';

void main() {
  Loading.configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: RootBinding(),
      initialRoute: AppRoute.root.rawValue,
      onGenerateRoute: AppRoute.onGenerateRoute,
      defaultTransition: Transition.noTransition,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
    );
  }
}
