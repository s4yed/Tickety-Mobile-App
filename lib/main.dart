import 'package:tickety_app/src/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:tickety_app/route_generator.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
    theme: ThemeData(
      primaryColor: Colors.teal[400],
      primaryColorDark: Colors.black54,
      appBarTheme: AppBarTheme(
        elevation: 2
      )
    ),
    home: HomePage(),
  )
);


