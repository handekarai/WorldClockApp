import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';
import 'package:worldclockapp/view/widget/welcome_widget.dart';
import 'package:worldclockapp/view/widget/theme_button.dart';
import 'package:worldclockapp/view_model/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../widget/custom_text_field.dart';
import '../widget/region_listview.dart';

// first screen after splash screen
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeViewModel _homeViewModel = HomeViewModel();

  setupData() async {
    WidgetsBinding.instance.window.platformBrightness == Brightness.dark ? _homeViewModel.changeTheme() : null;  //get device's theme
    await _homeViewModel.getRegions();                                                                           //get region's list
    await _homeViewModel.getUserTimeZone();                                                                      //get user's timezone information
    FlutterNativeSplash.remove();                                                                                //close splash screen after data comes
  }

  @override
  Widget build(BuildContext context) {
    setupData();
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: _homeViewModel.isLight ? lightBg : darkColor,
        body: Column(
          children: [
            SizedBox(
                height: 220.0,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      height: 199.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: _homeViewModel.isLight ? lightBlue : dark2Color,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(35.0)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 20.0,
                      left: 30.0,
                      child: WelcomeWidget(
                          isLight: _homeViewModel.isLight,
                          userTimeZone: _homeViewModel.userTimeZone,
                          userMonthName: _homeViewModel.getMonthName(
                              _homeViewModel.userTimeZone?.datetime.month),
                          userDayName: _homeViewModel.getDayName(
                              _homeViewModel.userTimeZone?.datetime),
                          welcomeMessage: _homeViewModel.getWelcomeMessage(_homeViewModel.userTimeZone?.datetime.hour),    
                      ),
                    ),
                    Positioned(
                        bottom: 117.0, //96+21(difference between sizedbox and container)
                        right: 33.0,
                        child: ThemeButton(
                            isLight: _homeViewModel.isLight,
                            onTap: _homeViewModel.changeTheme)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: CustomTextField(homeViewModel: _homeViewModel),
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 16.0), // figma:42  42 = 5top padding + 21 upper sizedbox-container difference + 16 this sized box
            Flexible(
              child: SingleChildScrollView(
                child: RegionListView(homeViewModel: _homeViewModel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
