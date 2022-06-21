import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
    required this.isLight,
  }) : super(key: key);

  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){print("asd");} ,
        child: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: isLight ? dark2Color: lightBg,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.fromBorderSide(BorderSide(color: isLight ? Colors.grey.shade400 : lightBlue ,width: 4.0)),
          ),
          child: Icon(
                    isLight
                        ? Icons.brightness_2
                        : Icons.sunny,
                    size: 20,
                    color: isLight ? lightBg: dark2Color,
                  ),
        ),
      );
  }
}
