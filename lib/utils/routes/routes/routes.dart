import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/routes/routes_name.dart';
import 'package:mvvm_provider/view/login_screen.dart';

import '../../../view/HomeScreen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RouteName.homescreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No Route Pages"),
              ),
            );
          },
        );
    }
  }
}
