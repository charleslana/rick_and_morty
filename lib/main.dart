import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/routes/app_route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      initialRoute: AppRoutes.home,
      defaultTransition: Transition.fade,
      onGenerateRoute: AppRouteGenerator().generateRoute,
    );
  }
}
