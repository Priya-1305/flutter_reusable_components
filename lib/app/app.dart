import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'bindings.dart';
import 'theme.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX UI Kit',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.pages,
      theme: AppTheme.light,
    );
  }
}
