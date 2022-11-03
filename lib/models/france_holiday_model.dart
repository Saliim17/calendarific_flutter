class FranceHolidayModel {
  Meta? meta;
  Response? response;

  FranceHolidayModel({this.meta, this.response});

  FranceHolidayModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Meta {
  int? code;

  Meta({this.code});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    return data;
  }
}

class Response {
  List<Holidays>? holidays;

  Response({this.holidays});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['holidays'] != null) {
      holidays = <Holidays>[];
      json['holidays'].forEach((v) {
        holidays!.add(Holidays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (holidays != null) {
      data['holidays'] = holidays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Holidays {
  String? name;
  String? description;
  Country? country;
  Date? date;
  List<String>? type;
  String? urlid;
  String? locations;
  String? states;

  Holidays(
      {this.name,
        this.description,
        this.country,
        this.date,
        this.type,
        this.urlid,
        this.locations,
        this.states});

  Holidays.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    type = json['type'].cast<String>();
    urlid = json['urlid'];
    locations = json['locations'];
    states = json['states'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (date != null) {
      data['date'] = date!.toJson();
    }
    data['type'] = type;
    data['urlid'] = urlid;
    data['locations'] = locations;
    data['states'] = states;
    return data;
  }
}

class Country {
  String? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Date {
  String? iso;
  Datetime? datetime;
  Timezone? timezone;

  Date({this.iso, this.datetime, this.timezone});

  Date.fromJson(Map<String, dynamic> json) {
    iso = json['iso'];
    datetime = json['datetime'] != null
        ? Datetime.fromJson(json['datetime'])
        : null;
    timezone = json['timezone'] != null
        ? Timezone.fromJson(json['timezone'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso'] = iso;
    if (datetime != null) {
      data['datetime'] = datetime!.toJson();
    }
    if (timezone != null) {
      data['timezone'] = timezone!.toJson();
    }
    return data;
  }
}

class Datetime {
  int? year;
  int? month;
  int? day;
  int? hour;
  int? minute;
  int? second;

  Datetime(
      {this.year, this.month, this.day, this.hour, this.minute, this.second});

  Datetime.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['month'] = month;
    data['day'] = day;
    data['hour'] = hour;
    data['minute'] = minute;
    data['second'] = second;
    return data;
  }
}

class Timezone {
  String? offset;
  String? zoneabb;
  int? zoneoffset;
  int? zonedst;
  int? zonetotaloffset;

  Timezone(
      {this.offset,
        this.zoneabb,
        this.zoneoffset,
        this.zonedst,
        this.zonetotaloffset});

  Timezone.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    zoneabb = json['zoneabb'];
    zoneoffset = json['zoneoffset'];
    zonedst = json['zonedst'];
    zonetotaloffset = json['zonetotaloffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['zoneabb'] = zoneabb;
    data['zoneoffset'] = zoneoffset;
    data['zonedst'] = zonedst;
    data['zonetotaloffset'] = zonetotaloffset;
    return data;
  }
}
