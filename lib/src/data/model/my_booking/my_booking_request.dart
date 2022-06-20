// To parse this JSON data, do
//
//     final myBookingRequest = myBookingRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyBookingRequest myBookingRequestFromJson(String str) => MyBookingRequest.fromJson(json.decode(str));

String myBookingRequestToJson(MyBookingRequest data) => json.encode(data.toJson());

class MyBookingRequest {
  MyBookingRequest({
    required this.userId,
    required this.pageNo,
  });

  final String userId;
  final String pageNo;

  factory MyBookingRequest.fromJson(Map<String, dynamic> json) => MyBookingRequest(
    userId: json["userId"],
    pageNo: json["pageNo"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "pageNo": pageNo,
  };
}
