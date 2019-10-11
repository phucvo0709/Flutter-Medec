import 'package:fl_medec/providers/page_provider.dart';
import 'package:fl_medec/screens/SplashScreen.dart';
import 'package:fl_medec/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Medeco',
        home: SplashScreen(),
        routes: {
          WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
        },
      ),
    );
  }
}
