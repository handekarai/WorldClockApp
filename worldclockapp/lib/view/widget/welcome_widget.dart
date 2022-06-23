import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

// shows user to him/her date-time on the top of home screen
class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget(
      {Key? key,
      required this.isLight,
      required this.userTimeZone,
      required this.userMonthName,
      required this.userDayName,
      required this.welcomeMessage})
      : super(key: key);

  final bool isLight;             // theme mode
  final userTimeZone;             // user's datetime
  final String userMonthName;     // month name
  final String userDayName;       // day name
  final String welcomeMessage;    // welcome message that changes according to time

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
            text: '$welcomeMessage, Özgür!',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            isLight: isLight),
        const SizedBox(height: 5.0),
        CustomTextWidget(
            text:'${userTimeZone?.datetime.hour.toString().length == 1 ? '0${userTimeZone?.datetime.hour}' : userTimeZone?.datetime.hour} : ${userTimeZone?.datetime.minute.toString().length == 1 ? '0${userTimeZone.datetime.minute}' : userTimeZone?.datetime.minute}',
            fontWeight: FontWeight.w600,
            fontSize: 32.0,
            isLight: isLight),
        const SizedBox(height: 5.0),
        CustomTextWidget(
            text: '${userTimeZone?.datetime.day} $userMonthName, $userDayName',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            isLight: isLight),
      ],
    );
  }
}
