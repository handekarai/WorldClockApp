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
        children:  [
          Text("Günaydınn,Özgür!",
              style: TextStyle(
                  color: isLight ? dark2Color: lightBlue, fontWeight: FontWeight.bold)),
          Text("09:54",
              style: TextStyle(
                  color: isLight ? dark2Color: lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0)),
          Text("8 Haziran, Çarşamba",
              style: TextStyle(
                  color: isLight ? dark2Color: lightBlue, fontWeight: FontWeight.bold)),
        ],
      );
  }
}