import 'api_helper.dart';

class WorldTimeApiService{

  var apiHelper = ApiHelper();

  Future fetchRegions() async {
    return await apiHelper.get('/timezone');
  }

  Future fetchUserTimeZone() async {
    return await apiHelper.get('/Europe/Istanbul'); //.get('/ip');
  }

  Future fetchRegionTimeZone(String region) async {
    return await apiHelper.get('/timezone/$region');
  }
}