import 'package:flutter/material.dart';
import 'package:worldclockapp/constant.dart';
import 'package:worldclockapp/view/widget/welcome_widget.dart';
import 'package:worldclockapp/view/widget/theme_button.dart';
import 'package:worldclockapp/view/widget/region_list_item_button.dart';
import 'package:worldclockapp/view_model/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeViewModel _homeViewModel = HomeViewModel();

  setupData() async {
    await _homeViewModel.getRegions();
    await _homeViewModel.getUserTimeZone();
    FlutterNativeSplash.remove();
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
                              _homeViewModel.userTimeZone.datetime.month),
                          userDayName: _homeViewModel.getDayName(
                              _homeViewModel.userTimeZone.datetime)),
                    ),
                    Positioned(
                        bottom:
                            117.0, //96+21(difference between sizedbox and container)
                        right: 33.0,
                        child: ThemeButton(
                            isLight: _homeViewModel.isLight,
                            onTap: _homeViewModel.changeTheme)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              prefixIcon:
                                  Image.asset('assets/images/search.png'),
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
                              hintText: 'Arama',
                              fillColor: whiteColor),
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(
                height:
                    16.0), // figma:42  42 = 5top padding + 21 upper sizedbox-container difference + 16 this sized box
            Flexible(
              child: SingleChildScrollView(
                child: ListView.builder(
                  padding: EdgeInsets.zero, //issue: list view inside scaffold with no appbar puts auto padding , this is solution to remove
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _homeViewModel.regions.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: RegionListItemButton(
                          name: _homeViewModel.regions[index],
                          isLight: _homeViewModel.isLight,
                          onPressed: () async {
                            await _homeViewModel.getRegionTimeZone(_homeViewModel.regions[index]);
                            _homeViewModel.splitRegionName(_homeViewModel.regions[index]);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        isLight: _homeViewModel.isLight,
                                        selectedTimeZone:
                                            _homeViewModel.selectedTimeZone,
                                            selectedArea: _homeViewModel.selectedArea,
                                            selectedLocation: _homeViewModel.selectedLocation,
                                            dayName: _homeViewModel.getDayName(_homeViewModel.selectedTimeZone.datetime),
                                            monthName: _homeViewModel.getMonthName(_homeViewModel.selectedTimeZone.datetime.month),
                                            )));
                          }),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
