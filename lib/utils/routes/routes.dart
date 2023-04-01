import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reqres_api_integration/utils/routes/routes_name.dart';
import 'package:reqres_api_integration/view/home_screen.dart';
import 'package:reqres_api_integration/view/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argume = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("no Route defined"),
            ),
          );
        });
    }
  }
}
