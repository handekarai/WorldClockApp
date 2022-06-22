import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key? key,
    required this.isLight,
  }) : super(key: key);

  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Günaydın,Özgür!",
            style: TextStyle(
                color: isLight ? darkColor : lightBlue,
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 5.0),
        Text("09 : 54",
            style: TextStyle(
                color: isLight ? darkColor : lightBlue,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 32.0)),
        const SizedBox(height: 5.0),
        Text("8 Haziran, Çarşamba",
            style: TextStyle(
                color: isLight ? darkColor : lightBlue,
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
