import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

import '../widget/time_container.dart';
import '../widget/detail_text_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.isLight, this.selectedTimeZone}) : super(key: key);

  final bool isLight;
  final selectedTimeZone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLight ? lightBg : darkColor,
      body: Column(children: [
        Stack(children: [
          Container(
            height: 111.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: isLight ? lightBlue : dark2Color,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(35.0)),
            ),
          ),
          Positioned(
            bottom: 25.0,
              left: 38.0,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: isLight ? Image.asset('assets/images/arrow_dark.png') : Image.asset('assets/images/arrow_light.png'),
              )),
          Positioned(
            top: MediaQuery.of(context).padding.top + 20.0,
            right: MediaQuery.of(context).size.width * .3,
            child: isLight ? Image.asset('assets/images/worldtime_dark.png') : Image.asset('assets/images/worldtime_light.png'),
          )
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(33.0, 50.0, 33.0, 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimeContainer(isLight: isLight, timeText: '13'),
              Text(':',
                  style: TextStyle(
                      fontSize: 70, color: isLight ? darkColor : Colors.white)),
              TimeContainer(isLight: isLight, timeText: '48')
            ],
          ),
        ),
        DetailTextWidget(isLight: isLight, text: 'Abidjan', fontSize: 24, fontWeight: FontWeight.w600),
        const SizedBox(height: 5.0),
        DetailTextWidget(isLight: isLight, text: selectedTimeZone.timezone, fontSize: 20),
        const SizedBox(height: 25.0),
        DetailTextWidget(isLight: isLight, text: 'Çarşamba, GMT + 01:00'),
        const SizedBox(height: 5.0),
        DetailTextWidget(isLight: isLight, text: 'Haziran 8, 2022'),
      ]),
    );
  }
}
