import 'package:flutter/material.dart';

import './screens/tabScreen.dart';
import './const/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI ChallengeD1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          foregroundColor: PRIMARYCOLOR,
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: ACCENTCOLOR,
          ),
          actionsIconTheme: IconThemeData(
            color: ACCENTCOLOR,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
              headline2: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: PRIMARYCOLOR,
              ),
              headline3: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: ACCENTCOLOR,
              ),
              headline4: TextStyle(
                fontWeight: FontWeight.w500,
                color: ACCENTCOLOR,
                fontSize: 16,
              ),
              headline5: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: PRIMARYCOLOR,
                  fontSize: 18),
              bodyText1: TextStyle(color: Colors.white, fontSize: 16),
              bodyText2: TextStyle(color: ACCENTCOLOR, fontSize: 18),
            ),
        iconTheme: ThemeData.light().iconTheme.copyWith(color: Colors.white),
      ),
      home: TabScreen(),
    );
  }
}
