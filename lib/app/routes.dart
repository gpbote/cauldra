import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';

class AppRoutes {
  static const String home = '/';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case home:
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}