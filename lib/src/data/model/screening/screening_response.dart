// To parse this JSON data, do
//
//     final screeningResponse = screeningResponseFromJson(jsonString);

import 'dart:convert';

class ScreeningResponse {
  ScreeningResponse({
    required this.screeningRequestId,
  });

  final int screeningRequestId;

  factory ScreeningResponse.fromRawJson(String str) => ScreeningResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScreeningResponse.fromJson(Map<String, dynamic> json) => ScreeningResponse(
    screeningRequestId: json["ScreeningRequestID"],
  );

  Map<String, dynamic> toJson() => {
    "ScreeningRequestID": screeningRequestId,
  };
}
