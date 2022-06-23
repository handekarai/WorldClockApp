import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';
import 'custom_text_widget.dart';

// represents region button in the list
class RegionListItemButton extends StatelessWidget {
  const RegionListItemButton({
    Key? key,
    required this.isLight,
    required this.onPressed,
    required this.name,
  }) : super(key: key);

  final bool isLight;         // theme mode
  final Function onPressed;   // button action
  final String name;          // button name

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(33.0, 5.0, 33.0, 5.0),
            child: Container(
              height: 54.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: isLight ? lightBlue : dark2Color,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 18.0, 10.0, 18.0),
                child: CustomTextWidget(
                    text: name,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    isLight: isLight),
              ),
            ),
          ),
          Positioned(
              right: 15.0,
              top: 17.0, // 12 + 5top padding
              bottom: 16.0, // 11 + 5bottom padding
              child: Container(
                  height: 31.0,
                  width: 31.0,
                  decoration: BoxDecoration(
                    color: isLight ? lightBlue : dark2Color,
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.fromBorderSide(BorderSide(
                        color: isLight ? lightBg : darkColor, width: 3.0)),
                  ),
                  child: isLight
                      ? Image.asset('assets/images/go_dark.png')
                      : Image.asset('assets/images/go_light.png')))
        ],
      ),
    );
  }
}
