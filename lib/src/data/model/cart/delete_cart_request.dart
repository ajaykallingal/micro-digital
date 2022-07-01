// To parse this JSON data, do
//
//     final deleteCartRequest = deleteCartRequestFromJson(jsonString);

import 'dart:convert';

DeleteCartRequest deleteCartRequestFromJson(String str) =>
    DeleteCartRequest.fromJson(json.decode(str));

String deleteCartRequestToJson(DeleteCartRequest data) =>
    json.encode(data.toJson());

class DeleteCartRequest {
  DeleteCartRequest({
    required this.userId,
    required this.productId,
  });

  final String userId;
  final String productId;

  factory DeleteCartRequest.fromJson(Map<String, dynamic> json) =>
      DeleteCartRequest(
        userId: json["userID"] == null ? null : json["userID"],
        productId: json["productID"] == null ? null : json["productID"],
      );

  Map<String, dynamic> toJson() => {
        "userID": userId == null ? null : userId,
        "productID": productId == null ? null : productId,
      };
}
