import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final double textWidth;
  final Function callback;

  const CalculatorButton({
    Key key,
    this.fillColor,
    this.text,
    this.textColor,
    this.textSize = 28,
    this.textWidth = 104,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(1.5),
      child: SizedBox(
        width: textWidth,
        height: 102,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Text(
            text,
            style: GoogleFonts.didactGothic(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor == null ? null : Color(fillColor),
          textColor: Color(0xFFFAFAFA),
        ),
      ),
    );
  }
}
