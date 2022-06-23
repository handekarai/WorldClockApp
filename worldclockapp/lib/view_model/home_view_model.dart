import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:worldclockapp/model/region_list_item_model.dart';
import 'package:worldclockapp/service/world_time_api_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store{

  final _worldTimeApiService = WorldTimeApiService();

  @observable
  var selectedArea;                 // to store selected area

  @observable
  var selectedLocation;             // to store selected location

  @observable
  var selectedTimeZone;             // to store user's selected timezone data coming from api

   @observable
  var userTimeZone;                 // to store user's timezone data coming from api

  @observable 
  var regions = ObservableList();   // to store region list coming from api

  @observable
  bool isLight = true;              // corresponds to theme is light mode or not

  // changes theme according to existed
  @action
  changeTheme(){
    isLight = !isLight;
  }

  // get timezone data of current user from api
  @action
  getUserTimeZone() async { 
    userTimeZone = RegionListItemModel.fromJson(await _worldTimeApiService.fetchUserTimeZone());
  }

  // get timezone data according to selected region from api
  @action
  getSelectedTimeZone(String region) async {
    selectedTimeZone = RegionListItemModel.fromJson(await _worldTimeApiService.fetchRegionTimeZone(region));
  }

  // gets region list from the api
  @action
  getRegions() async {
    regions = ObservableList.of(await _worldTimeApiService.fetchRegions());
  }

  // splits region name according to first slash
  @action 
  splitRegionName(String regionName){
    int idx = regionName.indexOf("/");
    selectedArea = regionName.substring(0,idx).trim();
    selectedLocation = regionName.substring(idx+1).trim();
  }

  // filters region list according to name with given keyword
  @action 
  filterRegions(String keyword){
     regions = ObservableList.of(regions.where((i) => (i.toLowerCase().contains(keyword.toLowerCase()))).toList());
  }

  // returns month name according to month number
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

  //converts name of day to turkish
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

  // changes welcome message according to hour
  String getWelcomeMessage(hour){
    hour = hour??12;

    if(hour >= 5 && hour < 12){
      return 'Günaydın';
    } 
    if(hour >= 12 && hour < 17 ){
      return 'İyi günler';
    }
    if(hour >= 17 && hour < 22 ){
      return 'İyi akşamlar';
    }
    return 'İyi geceler';
  }

}