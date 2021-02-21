import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;
  String calculation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String finalResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String comments() {
    if (_bmi >= 25) {
      return 'Your BMI level is Over the roof';
    } else if (_bmi > 18.5) {
      return 'Neat! Keep it up';
    } else {
      return 'Enough dieting!';
    }
  }
}
