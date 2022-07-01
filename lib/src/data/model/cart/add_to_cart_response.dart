// To parse this JSON data, do
//
//     final addToCartResponse = addToCartResponseFromJson(jsonString);

import 'dart:convert';

AddToCartResponse addToCartResponseFromJson(String str) =>
    AddToCartResponse.fromJson(json.decode(str));

String addToCartResponseToJson(AddToCartResponse data) =>
    json.encode(data.toJson());

class AddToCartResponse {
  AddToCartResponse({
    required this.cartList,
  });

  final List<CartList>? cartList;

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      AddToCartResponse(
        cartList: json["cartList"] == null
            ? null
            : List<CartList>.from(
                json["cartList"].map((x) => CartList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cartList": cartList == null
            ? null
            : List<dynamic>.from(cartList!.map((x) => x.toJson())),
      };
}

class CartList {
  CartList({
    required this.itemId,
    required this.productId,
    required this.amount,
    required this.price,
    required this.product,
    required this.timestamp,
  });

  final String itemId;
  final String productId;
  final String amount;
  final String price;
  final String product;
  final String timestamp;

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
        itemId: json["item_id"] == null ? null : json["item_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        amount: json["amount"] == null ? null : json["amount"],
        price: json["price"] == null ? null : json["price"],
        product: json["product"] == null ? null : json["product"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId == null ? null : itemId,
        "product_id": productId == null ? null : productId,
        "amount": amount == null ? null : amount,
        "price": price == null ? null : price,
        "product": product == null ? null : product,
        "timestamp": timestamp == null ? null : timestamp,
      };
}
