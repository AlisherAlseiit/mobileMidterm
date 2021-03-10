import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalculatorButton.dart';

import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
 const MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();

}


class MyAppState extends State<MyApp> {

  String  _expression = '';


  void numThatWasClicked(String text){
    setState(() {
      _expression += text;
    });
  }


  void clearExpressions(String text){
    setState(() {
      _expression = '';
    });
  }

  void evaluateNumbers(String text){

    _expression = _expression.replaceAll('÷', '/');
    _expression = _expression.replaceAll('×', '*');
    _expression = _expression.replaceAll('±', '-');
    Parser p = Parser();
    Expression exp = p.parse(_expression);

    
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      // _history = _expression;
      _expression = eval.toString();
    });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF303030),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                _expression,
                style: GoogleFonts.didactGothic(
                  textStyle: TextStyle(
                    fontSize: 70),
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1, 1),
            ),
            Row(

              children: <Widget>[
                CalculatorButton(
                  text: 'C',
                  fillColor: 0xFF424242,
                  callback: clearExpressions,
                  textSize: 30,
                ),
                CalculatorButton(
                  text: '±',
                  fillColor: 0xFF424242,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '%',
                  fillColor: 0xFF424242,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '÷',
                  fillColor: 0xFFFF8F00,
                  callback: numThatWasClicked,
                ),
              ],
            ),
            Row(

              children: <Widget>[
                CalculatorButton(
                  text: '7',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '8',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '9',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '×',
                  fillColor: 0xFFFF8F00,
                  callback: numThatWasClicked,
                ),
              ],
            ),
            Row(

              children: <Widget>[
                CalculatorButton(
                  text: '4',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '5',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '6',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '-',
                  fillColor: 0xFFFF8F00,
                  callback: numThatWasClicked,
                  textSize: 50,
                ),
              ],
            ),
            Row(

              children: <Widget>[
                CalculatorButton(
                  text: '1',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '2',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '3',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '+',
                  fillColor: 0xFFFF8F00,
                  callback: numThatWasClicked,
                  textSize: 40,
                ),
              ],
            ),
            Row(

              children: <Widget>[
                CalculatorButton(
                  text: '0',
                  fillColor: 0xFF616161,
                  textWidth: 211,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '.',
                  fillColor: 0xFF616161,
                  callback: numThatWasClicked,
                ),
                CalculatorButton(
                  text: '=',
                  fillColor: 0xFFFF8F00,
                  callback: evaluateNumbers,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
