// To parse this JSON data, do
//
//     final createProfileRequest = createProfileRequestFromJson(jsonString);

import 'dart:convert';

CreateProfileRequest createProfileRequestFromJson(String str) =>
    CreateProfileRequest.fromJson(json.decode(str));

String createProfileRequestToJson(CreateProfileRequest data) =>
    json.encode(data.toJson());

class CreateProfileRequest {
  CreateProfileRequest({
    required this.userId,
    required this.profileType,
    required this.sFirstname,
    required this.sLastname,
    required this.sAddress,
    required this.sAddress2,
    required this.sCity,
    required this.sState,
    required this.sCountry,
    required this.sZipcode,
    required this.sPhone,
    required this.sAddressType,
    required this.profileName,
  });

  final String userId;
  final String profileType;
  final String sFirstname;
  final String sLastname;
  final String sAddress;
  final String sAddress2;
  final String sCity;
  final String sState;
  final String sCountry;
  final String sZipcode;
  final String sPhone;
  final String sAddressType;
  final String profileName;

  factory CreateProfileRequest.fromJson(Map<String, dynamic> json) =>
      CreateProfileRequest(
        userId: json["user_id"] == null ? null : json["user_id"],
        profileType: json["profile_type"] == null ? null : json["profile_type"],
        sFirstname: json["s_firstname"] == null ? null : json["s_firstname"],
        sLastname: json["s_lastname"] == null ? null : json["s_lastname"],
        sAddress: json["s_address"] == null ? null : json["s_address"],
        sAddress2: json["s_address_2"] == null ? null : json["s_address_2"],
        sCity: json["s_city"] == null ? null : json["s_city"],
        sState: json["s_state"] == null ? null : json["s_state"],
        sCountry: json["s_country"] == null ? null : json["s_country"],
        sZipcode: json["s_zipcode"] == null ? null : json["s_zipcode"],
        sPhone: json["s_phone"] == null ? null : json["s_phone"],
        sAddressType:
            json["s_address_type"] == null ? null : json["s_address_type"],
        profileName: json["profile_name"] == null ? null : json["profile_name"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "profile_type": profileType == null ? null : profileType,
        "s_firstname": sFirstname == null ? null : sFirstname,
        "s_lastname": sLastname == null ? null : sLastname,
        "s_address": sAddress == null ? null : sAddress,
        "s_address_2": sAddress2 == null ? null : sAddress2,
        "s_city": sCity == null ? null : sCity,
        "s_state": sState == null ? null : sState,
        "s_country": sCountry == null ? null : sCountry,
        "s_zipcode": sZipcode == null ? null : sZipcode,
        "s_phone": sPhone == null ? null : sPhone,
        "s_address_type": sAddressType == null ? null : sAddressType,
        "profile_name": profileName == null ? null : profileName,
      };
}
