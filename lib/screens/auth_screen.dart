import 'package:fl_medec/widgets/form_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFFF4F6F9),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: -25.0,
            top: -250.0,
            child: Container(
              child: Image.asset(
                'assets/images/Ellipse 62.png',
              ),
            ),
          ),
          Positioned(
            right: -80.0,
            bottom: -100.0,
            child: Container(
              child: Image.asset(
                'assets/images/Ellipse 61.png',
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Text(
                    'Medico',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                child: FormAuth(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
