import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';

import '../widget/time_container.dart';
import '../widget/detail_text_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.isLight}) : super(key: key);

  final bool isLight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLight ? lightBg : darkColor,
      body: Column(children: [
        SizedBox(
          height: 135.0,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Container(
              height: 110.0,
              decoration: BoxDecoration(
                color: isLight ? lightBlue : dark2Color,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(35.0)),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).padding.top + 5.0,
                left: 10.0,
                child: BackButton(onPressed: () => Navigator.pop(context))),
            Positioned(
              top: MediaQuery.of(context).padding.top + 20.0,
              right: MediaQuery.of(context).size.width * .4,
              child: Text('World Time',
                  style: TextStyle(
                      color: isLight ? dark2Color : lightBlue,
                      fontWeight: FontWeight.bold)),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeContainer(isLight: isLight, timeText: '13'),
              Text(':',
                  style: TextStyle(
                      fontSize: 52, color: isLight ? darkColor : Colors.white)),
              TimeContainer(isLight: isLight, timeText: '48')
            ],
          ),
        ),
        DetailTextWidget(isLight: isLight, text: 'Abidjan'),
        const SizedBox(height: 5.0),
        DetailTextWidget(isLight: isLight, text: 'Africa'),
        const SizedBox(height: 30.0),
        DetailTextWidget(isLight: isLight, text: 'Çarşamba, GMT + 01:00'),
        const SizedBox(height: 5.0),
        DetailTextWidget(isLight: isLight, text: 'Haziran 8, 2022'),
      ]),
    );
  }
}
