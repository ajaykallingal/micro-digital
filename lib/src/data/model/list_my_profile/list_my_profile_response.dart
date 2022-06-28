// To parse this JSON data, do
//
//     final listMyProfileResponse = listMyProfileResponseFromJson(jsonString);

import 'dart:convert';

ListMyProfileResponse listMyProfileResponseFromJson(String str) =>
    ListMyProfileResponse.fromJson(json.decode(str));

String listMyProfileResponseToJson(ListMyProfileResponse data) =>
    json.encode(data.toJson());

class ListMyProfileResponse {
  ListMyProfileResponse({
    required this.myProfileList,
  });

  final List<MyProfileList>? myProfileList;

  factory ListMyProfileResponse.fromJson(Map<String, dynamic> json) =>
      ListMyProfileResponse(
        myProfileList: json["myProfileList"] == null
            ? null
            : List<MyProfileList>.from(
                json["myProfileList"].map((x) => MyProfileList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "myProfileList": myProfileList == null
            ? null
            : List<dynamic>.from(myProfileList!.map((x) => x.toJson())),
      };
}

class MyProfileList {
  MyProfileList({
    required this.profileId,
    required this.userId,
    required this.profileType,
    required this.bFirstname,
    required this.bLastname,
    required this.bAddress,
    required this.bAddress2,
    required this.bCity,
    required this.bCounty,
    required this.bState,
    required this.bCountry,
    required this.bZipcode,
    required this.bPhone,
    required this.sFirstname,
    required this.sLastname,
    required this.sAddress,
    required this.sAddress2,
    required this.sCity,
    required this.sCounty,
    required this.sState,
    required this.sCountry,
    required this.sZipcode,
    required this.sPhone,
    required this.sAddressType,
    required this.profileName,
    required this.profileUpdateTimestamp,
    required this.autosuggestion,
  });

  final String profileId;
  final String userId;
  final String profileType;
  final String bFirstname;
  final String bLastname;
  final String bAddress;
  final String bAddress2;
  final String bCity;
  final String bCounty;
  final String bState;
  final String bCountry;
  final String bZipcode;
  final String bPhone;
  final String sFirstname;
  final String sLastname;
  final String sAddress;
  final String sAddress2;
  final String sCity;
  final String sCounty;
  final String sState;
  final String sCountry;
  final String sZipcode;
  final String sPhone;
  final String sAddressType;
  final String profileName;
  final String profileUpdateTimestamp;
  final String autosuggestion;

  factory MyProfileList.fromJson(Map<String, dynamic> json) => MyProfileList(
        profileId: json["profile_id"] == null ? null : json["profile_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        profileType: json["profile_type"] == null ? null : json["profile_type"],
        bFirstname: json["b_firstname"] == null ? null : json["b_firstname"],
        bLastname: json["b_lastname"] == null ? null : json["b_lastname"],
        bAddress: json["b_address"] == null ? null : json["b_address"],
        bAddress2: json["b_address_2"] == null ? null : json["b_address_2"],
        bCity: json["b_city"] == null ? null : json["b_city"],
        bCounty: json["b_county"] == null ? null : json["b_county"],
        bState: json["b_state"] == null ? null : json["b_state"],
        bCountry: json["b_country"] == null ? null : json["b_country"],
        bZipcode: json["b_zipcode"] == null ? null : json["b_zipcode"],
        bPhone: json["b_phone"] == null ? null : json["b_phone"],
        sFirstname: json["s_firstname"] == null ? null : json["s_firstname"],
        sLastname: json["s_lastname"] == null ? null : json["s_lastname"],
        sAddress: json["s_address"] == null ? null : json["s_address"],
        sAddress2: json["s_address_2"] == null ? null : json["s_address_2"],
        sCity: json["s_city"] == null ? null : json["s_city"],
        sCounty: json["s_county"] == null ? null : json["s_county"],
        sState: json["s_state"] == null ? null : json["s_state"],
        sCountry: json["s_country"] == null ? null : json["s_country"],
        sZipcode: json["s_zipcode"] == null ? null : json["s_zipcode"],
        sPhone: json["s_phone"] == null ? null : json["s_phone"],
        sAddressType:
            json["s_address_type"] == null ? null : json["s_address_type"],
        profileName: json["profile_name"] == null ? null : json["profile_name"],
        profileUpdateTimestamp: json["profile_update_timestamp"] == null
            ? null
            : json["profile_update_timestamp"],
        autosuggestion:
            json["autosuggestion"] == null ? null : json["autosuggestion"],
      );

  Map<String, dynamic> toJson() => {
        "profile_id": profileId == null ? null : profileId,
        "user_id": userId == null ? null : userId,
        "profile_type": profileType == null ? null : profileType,
        "b_firstname": bFirstname == null ? null : bFirstname,
        "b_lastname": bLastname == null ? null : bLastname,
        "b_address": bAddress == null ? null : bAddress,
        "b_address_2": bAddress2 == null ? null : bAddress2,
        "b_city": bCity == null ? null : bCity,
        "b_county": bCounty == null ? null : bCounty,
        "b_state": bState == null ? null : bState,
        "b_country": bCountry == null ? null : bCountry,
        "b_zipcode": bZipcode == null ? null : bZipcode,
        "b_phone": bPhone == null ? null : bPhone,
        "s_firstname": sFirstname == null ? null : sFirstname,
        "s_lastname": sLastname == null ? null : sLastname,
        "s_address": sAddress == null ? null : sAddress,
        "s_address_2": sAddress2 == null ? null : sAddress2,
        "s_city": sCity == null ? null : sCity,
        "s_county": sCounty == null ? null : sCounty,
        "s_state": sState == null ? null : sState,
        "s_country": sCountry == null ? null : sCountry,
        "s_zipcode": sZipcode == null ? null : sZipcode,
        "s_phone": sPhone == null ? null : sPhone,
        "s_address_type": sAddressType == null ? null : sAddressType,
        "profile_name": profileName == null ? null : profileName,
        "profile_update_timestamp":
            profileUpdateTimestamp == null ? null : profileUpdateTimestamp,
        "autosuggestion": autosuggestion == null ? null : autosuggestion,
      };
}
