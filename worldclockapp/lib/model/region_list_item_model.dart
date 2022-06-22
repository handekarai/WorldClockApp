import 'package:intl/intl.dart';

class RegionListItemModel {
  String? abbreviation;
  String? clientIp;
  DateTime? datetime;
  int? dayOfWeek;
  int? dayOfYear;
  bool? dst;
  int? dstOffset;
  int? rawOffset;
  String? timezone;
  int? unixtime;
  String? utcDatetime;
  String? utcOffset;
  int? weekNumber;

  RegionListItemModel(
      {this.abbreviation,
      this.clientIp,
      this.datetime,
      this.dayOfWeek,
      this.dayOfYear,
      this.dst,
      this.dstOffset,
      this.rawOffset,
      this.timezone,
      this.unixtime,
      this.utcDatetime,
      this.utcOffset,
      this.weekNumber});

  RegionListItemModel.fromJson(Map<String, dynamic> json) {
    abbreviation = json['abbreviation'];
    clientIp = json['client_ip'];
    datetime = _time(json['datetime']);
    dayOfWeek = json['day_of_week'];
    dayOfYear = json['day_of_year'];
    dst = json['dst'];
    dstOffset = json['dst_offset'];
    rawOffset = json['raw_offset'];
    timezone = json['timezone'];
    unixtime = json['unixtime'];
    utcDatetime = json['utc_datetime'];
    utcOffset = json['utc_offset'];
    weekNumber = json['week_number'];
  }

  _time(datetime){
    DateTime now = DateTime.parse(datetime.substring(0, 26));
    return now;
  }
}
