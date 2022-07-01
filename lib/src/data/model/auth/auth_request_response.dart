// To parse this JSON data, do
//
//     final authUserRequestResponse = authUserRequestResponseFromJson(jsonString);

import 'dart:convert';

List<AuthUserRequestResponse> authUserRequestResponseFromJson(String str) =>
    List<AuthUserRequestResponse>.from(
        json.decode(str).map((x) => AuthUserRequestResponse.fromJson(x)));

String authUserRequestResponseToJson(List<AuthUserRequestResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AuthUserRequestResponse {
  AuthUserRequestResponse({
    required this.message,
    required this.userId,
    required this.profileId,
  });

  final String message;
  final bool userId;
  final bool profileId;

  factory AuthUserRequestResponse.fromJson(Map<String, dynamic> json) =>
      AuthUserRequestResponse(
        message: json["message"] == null ? null : json["message"],
        userId: json["UserID"] == null ? null : json["UserID"],
        profileId: json["ProfileID"] == null ? null : json["ProfileID"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "UserID": userId == null ? null : userId,
        "ProfileID": profileId == null ? null : profileId,
      };
}
