import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:worldclockapp/model/region_list_item_model.dart';
import 'package:worldclockapp/service/world_time_api_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store{

  final _worldTimeApiService = WorldTimeApiService();

  @observable
  var regions;

  @observable
  var selectedTimeZone;

  @observable
  var userTimeZone;

  @observable
  var isLight = true;


  String userMonthName(int month){
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

  String userDayName(date){
    switch(DateFormat('EEEE').format(date)){
      case 'Monday' : { return '';}
      case 'Tuesday' : { return '';}
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
  getRegionTimeZone() async {
    selectedTimeZone = RegionListItemModel.fromJson(await _worldTimeApiService.fetchRegionTimeZone());
  }

  @action
  getRegions() async {
    regions = await _worldTimeApiService.fetchRegions();
    print(regions);
  }

}