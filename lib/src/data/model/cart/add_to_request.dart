// To parse this JSON data, do
//
//     final addToCartRequest = addToCartRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddToCartRequest addToCartRequestFromJson(String str) => AddToCartRequest.fromJson(json.decode(str));

String addToCartRequestToJson(AddToCartRequest data) => json.encode(data.toJson());

class AddToCartRequest {
  AddToCartRequest({
    required this.userId,
    required this.productId,
    required this.productPrice,
  });

  final String userId;
  final String productId;
  final String productPrice;

  factory AddToCartRequest.fromJson(Map<String, dynamic> json) => AddToCartRequest(
    userId: json["userID"],
    productId: json["productID"],
    productPrice: json["productPrice"],
  );

  Map<String, dynamic> toJson() => {
    "userID": userId,
    "productID": productId,
    "productPrice": productPrice,
  };
}
