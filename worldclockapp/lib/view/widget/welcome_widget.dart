import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    Key? key,
      required this.isLight, required this.userTimeZone, required this.userMonthName, required this.userDayName
  }) : super(key: key);

  final isLight;
  final userTimeZone;
  final userMonthName;
  final userDayName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Günaydın, Özgür!",
            style: TextStyle(
                color: isLight ? darkColor : lightBlue,
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 5.0),
        Text('${userTimeZone.datetime.hour.toString().length == 1 ? '0${userTimeZone.datetime.hour}': userTimeZone.datetime.hour } : ${userTimeZone.datetime.minute.toString().length == 1 ? '0${userTimeZone.datetime.minute}' : userTimeZone.datetime.minute}',
            style: TextStyle(
                color: isLight ? darkColor : lightBlue,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 32.0)),
        const SizedBox(height: 5.0),
        Text('${userTimeZone.datetime.day} $userMonthName, $userDayName',
            style: TextStyle(
                color: isLight ? darkColor : lightBlue,
                fontFamily: 'Montserrat',
                fontSize: 15,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
