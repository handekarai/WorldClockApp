import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';


class RegionListItemButton extends StatelessWidget {
  const RegionListItemButton({
    Key? key,
    required this.isLight, required this.onPressed,
  }) : super(key: key);

  final bool isLight;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
            child: Container(
              height: 70.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: isLight ? lightBlue: dark2Color,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                child: Text('America/Argentina/Salta', style: TextStyle( color: isLight ? dark2Color: lightBlue)),
              ),
            ),
          ),
          Positioned(
            right: 15.0,
            top: 35.0,
            child: Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                color:isLight ? lightBlue: dark2Color,
                borderRadius: BorderRadius.circular(50.0),
                border: Border.fromBorderSide(BorderSide(color: isLight ? lightBg : darkColor ,width: 3.0)),
              ),
              child: Icon(Icons.play_arrow, color: isLight ? dark2Color : lightBg),
            ))
        ],
      ),
    );
  }
}
