// To parse this JSON data, do
//
//     final addToCartResponse = addToCartResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddToCartResponse addToCartResponseFromJson(String str) => AddToCartResponse.fromJson(json.decode(str));

String addToCartResponseToJson(AddToCartResponse data) => json.encode(data.toJson());

class AddToCartResponse {
  AddToCartResponse({
    required this.responseFromCart,
    required this.cartList,
  });

  final String responseFromCart;
  final List<CartList> cartList;

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) => AddToCartResponse(
    responseFromCart: json["responseFromCart"],
    cartList: List<CartList>.from(json["cartList"].map((x) => CartList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseFromCart": responseFromCart,
    "cartList": List<dynamic>.from(cartList.map((x) => x.toJson())),
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
    itemId: json["item_id"],
    productId: json["product_id"],
    amount: json["amount"],
    price: json["price"],
    product: json["product"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "product_id": productId,
    "amount": amount,
    "price": price,
    "product": product,
    "timestamp": timestamp,
  };
}
