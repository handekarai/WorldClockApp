import 'package:mobx/mobx.dart';
import 'package:worldclockapp/model/region_list_item_model.dart';
import 'package:worldclockapp/service/world_time_api_service.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store{

  final _worldTimeApiService = WorldTimeApiService();

  @observable
  var selectedTimeZone;

  @observable
  var userTimeZone;

  @observable
  var isLight = true;

  @action
  changeTheme(){
    isLight = !isLight;
  }
  @action
  getUserTimeZone()async{
    userTimeZone = RegionListItemModel.fromJson(await _worldTimeApiService.fetchUserTimeZone());
    print(userTimeZone);
  }
  @action
  getRegionTimeZone()async{
    selectedTimeZone = RegionListItemModel.fromJson(await _worldTimeApiService.fetchRegionTimeZone());
  }
}