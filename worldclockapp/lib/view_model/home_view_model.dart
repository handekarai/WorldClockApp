import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:worldclockapp/model/region_list_item_model.dart';
import 'package:worldclockapp/service/world_time_api_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store{

  final _worldTimeApiService = WorldTimeApiService();

  @observable
  var selectedArea,selectedLocation,selectedTimeZone,userTimeZone;

  @observable 
  var regions = ObservableList();

  @observable
  var isLight = true;


  String getMonthName(month){
    switch (month){
      case 1: { return 'Ocak';} 
      case 2: { return 'Şubat';} 
      case 3: { return 'Mart';} 
      case 4: { return 'Nisan';} 
      case 5: { return 'Mayıs';} 
      case 6: { return 'Haziran';} 
      case 7: { return 'Temmuz';} 
      case 8: { return 'Ağustos';} 
      case 9: { return 'Eylül';}
      case 10: { return 'Ekim';} 
      case 11: { return 'Kasım';} 
      case 12: { return 'Aralık';} 
    } 
    return 'null';
  }

  String getDayName(date){
    switch(DateFormat('EEEE').format(date??DateTime.now())){
      case 'Monday' : { return 'Pazartesi';}
      case 'Tuesday' : { return 'Salı';}
      case 'Wednesday' : { return 'Çarşamba';}
      case 'Thursday' : { return 'Perşembe';}
      case 'Friday' : { return 'Cuma';}
      case 'Saturday' : { return 'Cumartesi';}
      case 'Sunday' : { return 'Pazar';}
    }
    return 'null';
  }

  @action
  changeTheme(){
    isLight = !isLight;
  }
  @action
  getUserTimeZone() async { 
    userTimeZone = RegionListItemModel.fromJson(await _worldTimeApiService.fetchUserTimeZone());
   // print(userTimeZone);
  }
  @action
  getRegionTimeZone(String region) async {
    selectedTimeZone = RegionListItemModel.fromJson(await _worldTimeApiService.fetchRegionTimeZone(region));
  }

  @action
  getRegions() async {
    regions = ObservableList.of(await _worldTimeApiService.fetchRegions());
  }

  @action 
  splitRegionName(String regionName){
    int idx = regionName.indexOf("/");
    selectedArea = regionName.substring(0,idx).trim();
    selectedLocation = regionName.substring(idx+1).trim();
  }

  @action 
  filterRegions(String keyword){
     regions = ObservableList.of(regions.where((i) => (i.toLowerCase().contains(keyword.toLowerCase()))).toList());
  }
}