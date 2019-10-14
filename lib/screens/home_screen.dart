import 'package:fl_medec/widgets/slider_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Mumbai';
  List<String> values = [
    'Mumbai',
    'Dubai',
    'Ha Noi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[],
          ),
          Container(
            height: 143.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(110, 120, 247, 1),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 35.0,
                  spreadRadius: 0.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(26.0, 16.0, 20.0, 26.0),
                      child: Container(
                        child: Text(
                          'Medec',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(26.0, 16.0, 20.0, 26.0),
                      child: Container(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Colors.black,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: dropdownValue,
                              icon: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                                size: 10.0,
                              ),
                              iconSize: 14.0,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              onChanged: (String newSelected) {
                                setState(() {
                                  dropdownValue = newSelected;
                                });
                              },
                              items: values.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(),
          Positioned(
            top: 90,
            left: 33,
            right: 33,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(60.0 / 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset('assets/images/nurse.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 2.0),
                      child: Text(
                        'Doctor',
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 72, 1),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Search doctor \naround you',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromRGBO(137, 138, 143, 1),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(60.0 / 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset('assets/images/pill.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 2.0),
                      child: Text(
                        'Medicines',
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 72, 1),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Order Medicine \nto home',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromRGBO(137, 138, 143, 1),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(60.0 / 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset('assets/images/microscope.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 2.0),
                      child: Text(
                        'Digonostic',
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 72, 1),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Book test at \nDoorstep',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromRGBO(137, 138, 143, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: SliderHome(),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(17.0, 448.0, 17.0, 48.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Doctors nearby you',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.66,
                          color: Color.fromRGBO(63, 64, 121, 1),
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: 0.66,
                          color: Color.fromRGBO(58, 58, 252, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
