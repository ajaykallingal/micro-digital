// To parse this JSON data, do
//
//     final authUserRequest = authUserRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AuthUserRequest authUserRequestFromJson(String str) => AuthUserRequest.fromJson(json.decode(str));

String authUserRequestToJson(AuthUserRequest data) => json.encode(data.toJson());

class AuthUserRequest {
  AuthUserRequest({
    required this.phoneNo,
  });

  final String phoneNo;

  factory AuthUserRequest.fromJson(Map<String, dynamic> json) => AuthUserRequest(
    phoneNo: json["phoneNo"] == null ? null : json["phoneNo"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNo": phoneNo == null ? null : phoneNo,
  };
}
