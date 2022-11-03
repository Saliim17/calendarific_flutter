// To parse this JSON data, do
//
//     final jsonModel = jsonModelFromJson(jsonString);

import 'dart:convert';

JsonModel jsonModelFromJson(String str) => JsonModel.fromJson(json.decode(str));

String jsonModelToJson(JsonModel data) => json.encode(data.toJson());

class JsonModel {

  JsonModel({ this.response, });

  Response? response;

  factory JsonModel.fromJson(Map<String, dynamic> json) => JsonModel(
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response?.toJson(),
  };
}

class Response {

  Response({ required this.holidays });

  List<Holiday> holidays;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    holidays: List<Holiday>.from(json["holidays"].map((x) => Holiday.fromJson(x))));

  Map<String, dynamic> toJson() => {
    "holidays": List<dynamic>.from(holidays.map((x) => x.toJson())),
  };
}

class Holiday {

  Holiday({
    this.name,
    this.description,
    this.date,
  });

  String? name;
  String? description;
  Date? date;

  factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(

    name: json["name"],
    description: json["description"],
    date: Date.fromJson(json["date"]),

  );

  Map<String, dynamic> toJson() => {

    "name": name,
    "description": description,
    "date": date?.toJson()

  };
}

class Date {

  Date({ this.iso });

  dynamic iso;

  factory Date.fromJson(Map<String, dynamic> json) => Date(iso: json["iso"],);

  Map<String, dynamic> toJson() => { "iso": iso };
}
