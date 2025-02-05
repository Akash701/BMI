import 'package:flutter/material.dart';
import 'Input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0D21),
        scaffoldBackgroundColor: Color(0xFF0A0D21),
      ),
      home: InputPage(),
    );
  }
}
