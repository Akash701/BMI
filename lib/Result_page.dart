import 'package:bmi_calculator/Input_page.dart';
import 'package:bmi_calculator/reuseablecard_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiresult,
      @required this.resultText,
      @required this.interpertation});
  final String bmiresult;
  final String resultText;
  final String interpertation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Text(
            'Your Result',
            style: kresultStyle,
          ),
          Expanded(
            flex: 50,
            child: Reuseablecard(
              colour: kactiveColor,
              cardchild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      resultText.toUpperCase(),
                      style: kresultcolor,
                    ),
                  ),
                  Center(
                    child: Text(
                      bmiresult,
                      style: kbmivalue,
                    ),
                  ),
                  Text(
                    interpertation,
                    style: kbmicomment,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ));
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kcalculate,
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              color: kBottomcontainerColor1,
              height: kBottomcontainerHeight,
              padding: EdgeInsets.only(bottom: 20),
            ),
          ),
        ],
      ),
    );
  }
}
