import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({
    Key? key,
    required this.isLight, required this.timeText,
  }) : super(key: key);

  final bool isLight;
  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: 140.0,
      decoration: BoxDecoration(
        color: isLight ? whiteColor : dark2Color,
        borderRadius: BorderRadius.circular(14.0),
        border: const Border.fromBorderSide(
            BorderSide(color: darkColor, width: 2.0)),
      ),
      child: Center(
        child: Text(timeText.length == 1 ? '0$timeText': timeText,
            style: TextStyle(
                color: isLight ? darkColor : whiteColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 79)),
      ),
    );
  }
}
