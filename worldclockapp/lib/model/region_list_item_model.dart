
// region's timezone model according to api

class RegionListItemModel {
  DateTime? datetime;
  String? utcOffset;

  RegionListItemModel({
    this.datetime,
    this.utcOffset,
  });

  RegionListItemModel.fromJson(Map<String, dynamic> json) {
    datetime = _time(json['datetime']);
    utcOffset = json['utc_offset'];
  }

  // converts '2022-06-23T17:13:32.739926+03:00' to '2022-06-23T17:13:32.739926'
  _time(datetime) {
    DateTime now = DateTime.parse(datetime.substring(0, 26));
    return now;
  }
}
