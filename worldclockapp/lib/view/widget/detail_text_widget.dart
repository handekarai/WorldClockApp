import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

class DetailTextWidget extends StatelessWidget {
  const DetailTextWidget({
    Key? key,
    required this.isLight, required this.text,
  }) : super(key: key);

  final bool isLight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: isLight ? darkColor : Colors.white,
            fontWeight: FontWeight.bold));
  }
}
