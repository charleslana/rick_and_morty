import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/src/bindings/character_binding.dart';
import 'package:rick_and_morty/src/bindings/home_binding.dart';
import 'package:rick_and_morty/src/pages/home_page.dart';

part 'app_routes.dart';

class AppRouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return GetPageRoute(
          page: () => const HomePage(),
          settings: settings,
          bindings: [
            HomeBinding(),
            CharacterBinding(),
          ],
        );
      default:
        return GetPageRoute(
          page: () => SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('No path for ${settings.name}'),
              ),
            ),
          ),
        );
    }
  }
}
