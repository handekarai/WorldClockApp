import 'api_helper.dart';

class WorldTimeApiService{

  var apiHelper = ApiHelper();

  // api call to fetch region list
  Future fetchRegions() async {
    return await apiHelper.get('/timezone');
  }

  // api call to fetch user's timezone data 
  Future fetchUserTimeZone() async {
    return await apiHelper.get('/Europe/Istanbul'); // api not working .get('/ip') , for this reason i changed it to /Europe/Istanbul
  }

  // api call to fetch given region's timezone data 
  Future fetchRegionTimeZone(String region) async {
    return await apiHelper.get('/timezone/$region');
  }
}