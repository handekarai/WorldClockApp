import 'package:flutter/material.dart';
import '../screen/detail_screen.dart';
import 'region_list_item_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// list view in the home screen
class RegionListView extends StatelessWidget {
  const RegionListView({
    Key? key,
    required homeViewModel,
  }) : _homeViewModel = homeViewModel, super(key: key);

  final _homeViewModel;    

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => ListView.builder(
        padding: EdgeInsets.zero, //issue: list view inside scaffold with no appbar puts auto padding , this is solution to remove
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _homeViewModel.regions.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RegionListItemButton(
                name: _homeViewModel.regions[index],
                isLight: _homeViewModel.isLight,
                onPressed: () async {
                  await _homeViewModel.getSelectedTimeZone(_homeViewModel.regions[index]);
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
                                  dayName: _homeViewModel.getDayName(_homeViewModel.selectedTimeZone?.datetime),
                                  monthName: _homeViewModel.getMonthName(_homeViewModel.selectedTimeZone?.datetime.month),
                                  )));
                }),
          );
        },
      ),
    );
  }
}
