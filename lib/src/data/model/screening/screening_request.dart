// To parse this JSON data, do
//
//     final screeningRequest = screeningRequestFromJson(jsonString);

import 'dart:convert';

class ScreeningRequest {
  ScreeningRequest({
    required this.name,
    required this.phone,
    required this.notes,
    required this.type,
    required this.requestFrom,
  });

  final String name;
  final String phone;
  final String notes;
  final String type;
  final String requestFrom;

  factory ScreeningRequest.fromRawJson(String str) => ScreeningRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScreeningRequest.fromJson(Map<String, dynamic> json) => ScreeningRequest(
    name: json["Name"],
    phone: json["Phone"],
    notes: json["Notes"],
    type: json["Type"],
    requestFrom: json["RequestFrom"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Phone": phone,
    "Notes": notes,
    "Type": type,
    "RequestFrom": requestFrom,
  };
}
