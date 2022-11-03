// To parse this JSON data, do
//
//     final franceHolidays = franceHolidaysFromJson(jsonString);

import 'dart:convert';

JsonModel jsonModelFromJson(String str) => JsonModel.fromJson(json.decode(str));

String jsonModelToJson(JsonModel data) => json.encode(data.toJson());

class JsonModel {
  JsonModel({
    this.response,
  });
  Response? response;

  factory JsonModel.fromJson(Map<String, dynamic> json) => JsonModel(
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response?.toJson(),
  };
}


class Response {
  Response({
    required this.holidays,
  });

  List<Holiday> holidays;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    holidays: List<Holiday>.from(json["holidays"].map((x) => Holiday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "holidays": List<dynamic>.from(holidays.map((x) => x.toJson())),
  };
}

class Holiday {
  Holiday({
    this.name,
    this.description,
    this.country,
    this.date,
    required this.type,
    this.urlid,
    this.locations,
    this.states,
  });

  String? name;
  String? description;
  Country? country;
  Date? date;
  List<String> type;
  String? urlid;
  Locations? locations;
  dynamic states;

  factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
    name: json["name"],
    description: json["description"],
    country: Country.fromJson(json["country"]),
    date: Date.fromJson(json["date"]),
    type: List<String>.from(json["type"].map((x) => x)),
    urlid: json["urlid"],
    locations: locationsValues.map[json["locations"]],
    states: json["states"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "country": country?.toJson(),
    "date": date?.toJson(),
    "type": List<dynamic>.from(type.map((x) => x)),
    "urlid": urlid,
    "locations": locationsValues.reverse![locations],
    "states": states,
  };
}

class Country {
  Country({
    this.id,
    this.name,
  });

  Id? id;
  Name? name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: idValues.map[json["id"]],
    name: nameValues.map[json["name"]],
  );

  Map<String, dynamic> toJson() => {
    "id": idValues.reverse![id],
    "name": nameValues.reverse![name],
  };
}

enum Id { FR, ES }

final idValues = EnumValues({
  "fr": Id.FR,
  "es": Id.ES
});

enum Name { FRANCE,SPAIN }

final nameValues = EnumValues({
  "France": Name.FRANCE,
  "Spain" : Name.SPAIN
});

class Date {
  Date({
    this.iso,
    this.datetime,
    this.timezone,
  });

  dynamic iso;
  Datetime? datetime;
  Timezone? timezone;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    iso: json["iso"],
    datetime: Datetime.fromJson(json["datetime"]),
    timezone: json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]),
  );

  Map<String, dynamic> toJson() => {
    "iso": iso,
    "datetime": datetime?.toJson(),
    "timezone": timezone == null ? null : timezone?.toJson(),
  };
}

class Datetime {
  Datetime({
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.second,
  });

  int? year;
  int? month;
  int? day;
  int? hour;
  int? minute;
  int? second;

  factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
    year: json["year"],
    month: json["month"],
    day: json["day"],
    hour: json["hour"],
    minute: json["minute"],
    second: json["second"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "month": month,
    "day": day,
    "hour": hour,
    "minute": minute,
    "second": second,
  };
}

class Timezone {
  Timezone({
    this.offset,
    this.zoneabb,
    this.zoneoffset,
    this.zonedst,
    this.zonetotaloffset,
  });

  String? offset;
  String? zoneabb;
  int? zoneoffset;
  int? zonedst;
  int? zonetotaloffset;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    offset: json["offset"],
    zoneabb: json["zoneabb"],
    zoneoffset: json["zoneoffset"],
    zonedst: json["zonedst"],
    zonetotaloffset: json["zonetotaloffset"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "zoneabb": zoneabb,
    "zoneoffset": zoneoffset,
    "zonedst": zonedst,
    "zonetotaloffset": zonetotaloffset,
  };
}

enum Locations { ALL, MOSELLE_BAS_RHIN_HAUT_RHIN }

final locationsValues = EnumValues({
  "All": Locations.ALL,
  "Moselle, Bas-Rhin, Haut-Rhin": Locations.MOSELLE_BAS_RHIN_HAUT_RHIN
});

class State {
  State({
    this.id,
    this.abbrev,
    this.name,
    this.exception,
    this.iso,
  });

  int? id;
  dynamic abbrev;
  String? name;
  dynamic exception;
  String? iso;

  factory State.fromJson(Map<String, dynamic> json) => State(
    id: json["id"],
    abbrev: json["abbrev"],
    name: json["name"],
    exception: json["exception"],
    iso: json["iso"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "abbrev": abbrev,
    "name": name,
    "exception": exception,
    "iso": iso,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
