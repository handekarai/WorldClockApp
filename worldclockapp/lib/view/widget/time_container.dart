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
      height: 150.0,
      width: 150.0,
      decoration: BoxDecoration(
        color: isLight ? Colors.white : dark2Color,
        borderRadius: BorderRadius.circular(10.0),
        border: const Border.fromBorderSide(
            BorderSide(color: darkColor, width: 2.0)),
      ),
      child: Center(
        child: Text(timeText,
            style: TextStyle(
                color: isLight ? darkColor : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 90)),
      ),
    );
  }
}
