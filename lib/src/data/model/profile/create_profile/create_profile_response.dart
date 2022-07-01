// To parse this JSON data, do
//
//     final createProfileResponse = createProfileResponseFromJson(jsonString);

import 'dart:convert';

CreateProfileResponse createProfileResponseFromJson(String str) =>
    CreateProfileResponse.fromJson(json.decode(str));

String createProfileResponseToJson(CreateProfileResponse data) =>
    json.encode(data.toJson());

class CreateProfileResponse {
  CreateProfileResponse({
    required this.profileId,
  });

  final int profileId;

  factory CreateProfileResponse.fromJson(Map<String, dynamic> json) =>
      CreateProfileResponse(
        profileId: json["ProfileID"] == null ? null : json["ProfileID"],
      );

  Map<String, dynamic> toJson() => {
        "ProfileID": profileId == null ? null : profileId,
      };
}
