import 'api_helper.dart';

class WorldTimeApiService{

  var apiHelper = ApiHelper();

  Future fetchRegions() async {
    return await apiHelper.get('/timezone');
  }

  Future fetchUserTimeZone() async {
    return await apiHelper.get('/Europe/Istanbul'); //.get('/ip');
  }

  Future fetchRegionTimeZone() async {
    return await apiHelper.get('/timezone/America/Argentina/Salta');
  }
}