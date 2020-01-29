import 'package:tickety_app/src/pages/home/home.dart';
import 'package:tickety_app/src/pages/profile/profile.dart';
import 'package:tickety_app/src/pages/profile/user_tickets.dart';
import 'package:flutter/material.dart';
import 'package:tickety_app/src/pages/auth/login.dart';
import 'package:tickety_app/src/pages/auth/register.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage(data: args));
        // return MaterialPageRoute(builder: (_) => HomePage());
      case '/myTickets':
        return MaterialPageRoute(builder: (_) => UserTicketPage());
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Routing Error'),
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: Text('[ROUTE ERROR]', style: TextStyle(color: Colors.red[300], fontSize: 20),)
          ),
        );
      }
    );
  }
}