// To parse this JSON data, do
//
//     final checkoutOrderResponse = checkoutOrderResponseFromJson(jsonString);

import 'dart:convert';

CheckoutOrderResponse checkoutOrderResponseFromJson(String str) =>
    CheckoutOrderResponse.fromJson(json.decode(str));

String checkoutOrderResponseToJson(CheckoutOrderResponse data) =>
    json.encode(data.toJson());

class CheckoutOrderResponse {
  CheckoutOrderResponse({
    required this.orderResponse,
  });

  final OrderResponse? orderResponse;

  factory CheckoutOrderResponse.fromJson(Map<String, dynamic> json) =>
      CheckoutOrderResponse(
        orderResponse: json["OrderResponse"] == null
            ? null
            : OrderResponse.fromJson(json["OrderResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "OrderResponse": orderResponse == null ? null : orderResponse!.toJson(),
      };
}

class OrderResponse {
  OrderResponse({
    required this.orderId,
    required this.message,
  });

  final int orderId;
  final String message;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        orderId: json["order_id"] == null ? null : json["order_id"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId == null ? null : orderId,
        "message": message == null ? null : message,
      };
}
