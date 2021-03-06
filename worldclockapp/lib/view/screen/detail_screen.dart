import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';
import '../widget/time_container.dart';
import '../widget/custom_text_widget.dart';

// shows detail time information for selected region in region list
class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.isLight, this.selectedTimeZone, required this.selectedArea, required this.selectedLocation, required this.dayName, required this.monthName}) : super(key: key);

  final bool isLight;               // theme mode
  final selectedTimeZone;           // selected timezone datetime info
  final String selectedArea;       // selected area name
  final String selectedLocation;   // selected location name
  final String dayName;            // day name
  final String monthName;          // month name

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
              TimeContainer(isLight: isLight, timeText: '${selectedTimeZone.datetime.hour}'),
              Text(':',style: TextStyle(fontSize: 70, color: isLight ? darkColor : whiteColor)),
              TimeContainer(isLight: isLight, timeText: '${selectedTimeZone.datetime.minute}')
            ],
          ),
        ),
        CustomTextWidget(isLight: isLight, text: selectedArea, fontSize: 24, fontWeight: FontWeight.w600),
        const SizedBox(height: 5.0),
        CustomTextWidget(isLight: isLight, text: selectedLocation, fontSize: 20),
        const SizedBox(height: 25.0),
        CustomTextWidget(isLight: isLight, text: '$dayName, GMT ${selectedTimeZone.utcOffset}'),
        const SizedBox(height: 5.0),
        CustomTextWidget(isLight: isLight, text: '$monthName ${selectedTimeZone.datetime.day}, ${selectedTimeZone.datetime.year}'),
      ]),
    );
  }
}
