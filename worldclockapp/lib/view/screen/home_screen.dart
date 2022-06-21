import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';
import 'package:worldclockapp/view/widget/welcome_widget.dart';
import 'package:worldclockapp/view/widget/theme_button.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  var isLight = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLight ? lightBg: darkColor,
      body: Column(
        children: [
                SizedBox(
                height: 235.0,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                        height: 210.0,
                        decoration: BoxDecoration(
                          color: isLight ? lightBlue: dark2Color,
                          borderRadius:
                              const BorderRadius.vertical(bottom: Radius.circular(35.0)),
                        ),
                      ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 20.0,
                      left: 30.0,
                      child: WelcomeWidget(isLight: isLight),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 20.0,
                      right: 20.0,
                      child: ThemeButton(isLight: isLight)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              prefixIcon:
                                  const Icon(Icons.search, color: darkColor),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: strokeBlue),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: strokeBlue),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              filled: true,
                              hintStyle: const TextStyle(color: darkColor),
                              hintText: "Arama",
                              fillColor: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
        ],
      ),
    );
  }
}
