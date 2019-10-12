import 'package:fl_medec/providers/auth_provider.dart';
import 'package:fl_medec/providers/page_provider.dart';
import 'package:fl_medec/screens/auth_screen.dart';
import 'package:fl_medec/screens/splash_screen.dart';
import 'package:fl_medec/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: PageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Medeco',
        home: AuthScreen(),
        routes: {
          WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
        },
      ),
    );
  }
}
