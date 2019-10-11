import 'package:fl_medec/screens/SplashScreen.dart';
import 'package:fl_medec/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medeco',
      home: SplashScreen(),
      routes: {
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
      },
    );
  }
}
