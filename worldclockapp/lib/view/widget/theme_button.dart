import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
    required this.isLight, required this.onTap,
  }) : super(key: key);

  final bool isLight;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 40.0,
          width: 41.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: isLight ? darkColor.withOpacity(.2) : whiteColor.withOpacity(.2) ,width: 3.0),
            ),
          child: Container(
            height: 34.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: isLight ? darkColor: whiteColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: isLight ? Image.asset('assets/images/moon.png') : Image.asset('assets/images/sun.png')
          ),
        ),
      );
  }
}