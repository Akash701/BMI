import 'package:flutter/material.dart';

class Reuseablecard extends StatelessWidget {
  Reuseablecard({@required this.colour, this.cardchild, this.onPress});
  final Color colour;
  final Widget cardchild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
