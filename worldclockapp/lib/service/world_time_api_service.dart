import 'api_helper.dart';

class WorldTimeApiService{

  var apiHelper = ApiHelper();

  Future fetchUserTimeZone()async{
    return await apiHelper.get('/ip');
  }

  Future fetchRegionTimeZone()async{
    return await apiHelper.get('/timezone/America/Argentina/Salta');
  }
}