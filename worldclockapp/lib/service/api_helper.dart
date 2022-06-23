import 'dart:convert';
import "package:http/http.dart" as http;
import 'app_exception.dart';

class ApiHelper {
  final String _baseUrl =
      "http://worldtimeapi.org/api/"; // api base url for timezones

// http get method for general use
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } catch (e) {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

// return response according to status code
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
