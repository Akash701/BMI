import 'package:bmi_calculator/Result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'character_class.dart';
import 'reuseablecard_class.dart';
import 'Constants.dart';
import 'Result_page.dart';
import 'Calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Gender selectedGender;

class _InputPageState extends State<InputPage> {
  // Color maleactivecolor = inactiveColor;
  // Color femaleactivecolor = inactiveColor;
// male = 1 and female = 2
//   void updatecolor(Gender gender) {
//     if (gender == Gender.male) {
//     if  (maleactivecolor == inactiveColor){
//         maleactivecolor = activeColor;
//         femaleactivecolor = inactiveColor;
//       } else {
//         maleactivecolor = inactiveColor;
//       }
//     }
//     if (gender == Gender.female) {
//       if (femaleactivecolor == inactiveColor) {
//         femaleactivecolor = activeColor;
//         maleactivecolor = inactiveColor;
//       } else {
//         femaleactivecolor = inactiveColor;
//       }
//     }
//   }
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactiveColor
                        : kinactiveColor,
                    cardchild: Character(
                      icons: FontAwesomeIcons.mars,
                      label: ('MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kactiveColor
                        : kinactiveColor,
                    cardchild: Character(
                      icons: FontAwesomeIcons.venus,
                      label: ('FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              height.toString(),
                              style: kCommonNumberStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xFFFFFFFF),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30,
                            ),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 110,
                              max: 220,
                              //activeColor: Color(0xFFEB1555),
                              inactiveColor: Color(0xFF8D8F98),
                              onChanged: (newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              }),
                        ),
                      ],
                    ),
                    colour: kCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuseablecard(
                    colour: kCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kCommonNumberStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundButton(
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ]),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseablecard(
                    colour: kCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kCommonNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator cal = Calculator(weight: weight, height: height);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiresult: cal.calculation(),
                      resultText: cal.finalResult(),
                      interpertation: cal.comments(),
                    ),
                  ));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kcalculate,
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              color: kBottomcontainerColor1,
              height: kBottomcontainerHeight,
              padding: EdgeInsets.only(bottom: 20),
            ),
          )
        ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({
    @required this.icon,
    this.onpress,
  });
  final IconData icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      disabledElevation: 10,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
      shape: CircleBorder(),
      elevation: 20,
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
