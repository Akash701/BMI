import 'package:flutter/material.dart';
import 'Constants.dart';

class Character extends StatelessWidget {
  Character({this.icons, this.label});
  final IconData icons;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80.0,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
