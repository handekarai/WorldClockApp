import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

// text widget for each text in the app
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    required this.isLight, required this.text, this.fontSize, this.fontWeight,
  }) : super(key: key);

  final bool isLight;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: isLight ? darkColor : whiteColor,
            fontFamily: 'Montserrat',
            fontSize: fontSize?? 18,
            fontWeight: fontWeight?? FontWeight.w500));
  }
}
