import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';
import 'custom_text_widget.dart';

// one of the boxes in time area of the detail screen
class TimeContainer extends StatelessWidget {
  const TimeContainer({
    Key? key,
    required this.isLight,
    required this.timeText,
  }) : super(key: key);

  final bool isLight;     // theme mode
  final String timeText;  // hour or minute text 

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
        child: CustomTextWidget(text: timeText.length == 1 ? '0$timeText' : timeText,fontWeight: FontWeight.w600,fontSize: 79, isLight: isLight),
      ),
    );
  }
}
