// To parse this JSON data, do
//
//     final authGetUserResponse = authGetUserResponseFromJson(jsonString);

import 'dart:convert';

AuthGetUserResponse authGetUserResponseFromJson(String str) =>
    AuthGetUserResponse.fromJson(json.decode(str));

String authGetUserResponseToJson(AuthGetUserResponse data) =>
    json.encode(data.toJson());

class AuthGetUserResponse {
  AuthGetUserResponse({
    required this.authUserResponse,
  });

  final AuthUserResponse? authUserResponse;

  factory AuthGetUserResponse.fromJson(Map<String, dynamic> json) =>
      AuthGetUserResponse(
        authUserResponse: json["authUserResponse"] == null
            ? null
            : AuthUserResponse.fromJson(json["authUserResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "authUserResponse":
            authUserResponse == null ? null : authUserResponse!.toJson(),
      };
}

class AuthUserResponse {
  AuthUserResponse({
    required this.otp,
    required this.phoneNumber,
    required this.newUser,
    required this.userId,
  });

  final String otp;
  final String phoneNumber;
  final bool newUser;
  final String userId;

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) =>
      AuthUserResponse(
        otp: json["otp"] == null ? null : json["otp"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        newUser: json["newUser"] == null ? null : json["newUser"],
        userId: json["userID"] == null ? null : json["userID"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp == null ? null : otp,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "newUser": newUser == null ? null : newUser,
        "userID": userId == null ? null : userId,
      };
}
