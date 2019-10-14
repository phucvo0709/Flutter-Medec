import 'package:fl_medec/providers/auth_provider.dart';
import 'package:fl_medec/providers/page_provider.dart';
import 'package:fl_medec/providers/slider_provider.dart';
import 'package:fl_medec/screens/auth_screen.dart';
import 'package:fl_medec/screens/home_screen.dart';
import 'package:fl_medec/screens/splash_screen.dart';
import 'package:fl_medec/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        ChangeNotifierProvider.value(
          value: SliderProvider(),
        )
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Medico',
          theme: ThemeData(
            primaryColor: Color.fromRGBO(110, 120, 247, 1),
          ),
          home: FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (BuildContext context,
                AsyncSnapshot<SharedPreferences> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return SplashScreen();
                default:
                  return snapshot.data.getBool("isFirst") == null
                      ? WelcomeScreen()
                      : auth.isAuth
                          ? HomeScreen()
                          : FutureBuilder(
                              future: auth.tryAutoLogin(),
                              builder: (ctx, authResultSnapshot) =>
                                  authResultSnapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? SplashScreen()
                                      : AuthScreen(),
                            );
              }
            },
          ),
          routes: {
            WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
          },
        ),
      ),
    );
  }
}
