// To parse this JSON data, do
//
//     final checkoutOrderRequest = checkoutOrderRequestFromJson(jsonString);

import 'dart:convert';

CheckoutOrderRequest checkoutOrderRequestFromJson(String str) =>
    CheckoutOrderRequest.fromJson(json.decode(str));

String checkoutOrderRequestToJson(CheckoutOrderRequest data) =>
    json.encode(data.toJson());

class CheckoutOrderRequest {
  CheckoutOrderRequest({
    required this.userPayLoad,
  });

  final UserPayLoad? userPayLoad;

  factory CheckoutOrderRequest.fromJson(Map<String, dynamic> json) =>
      CheckoutOrderRequest(
        userPayLoad: json["userPayLoad"] == null
            ? null
            : UserPayLoad.fromJson(json["userPayLoad"]),
      );

  Map<String, dynamic> toJson() => {
        "userPayLoad": userPayLoad == null ? null : userPayLoad!.toJson(),
      };
}

class UserPayLoad {
  UserPayLoad({
    required this.userId,
    required this.shippingId,
    required this.paymentId,
    required this.profileId,
    required this.total,
    required this.firstname,
    required this.lastname,
    required this.sAddress,
    required this.sCity,
    required this.sState,
    required this.sCountry,
    required this.sZipcode,
    required this.phone,
    required this.email,
    required this.notes,
    required this.deliveryDate,
    required this.deliveryTimeFrom,
    required this.deliveryTimeTo,
    // required this.couponCodes,
  });

  final String userId;
  final String shippingId;
  final String paymentId;
  final String profileId;
  final String total;
  final String firstname;
  final String lastname;
  final String sAddress;
  final String sCity;
  final String sState;
  final String sCountry;
  final String sZipcode;
  final String phone;
  final String email;
  final String notes;
  final String deliveryDate;
  final String deliveryTimeFrom;
  final String deliveryTimeTo;
  // final String couponCodes;

  factory UserPayLoad.fromJson(Map<String, dynamic> json) => UserPayLoad(
        userId: json["user_id"] == null ? null : json["user_id"],
        shippingId: json["shipping_id"] == null ? null : json["shipping_id"],
        paymentId: json["payment_id"] == null ? null : json["payment_id"],
        profileId: json["profile_id"] == null ? null : json["profile_id"],
        total: json["total"] == null ? null : json["total"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        sAddress: json["s_address"] == null ? null : json["s_address"],
        sCity: json["s_city"] == null ? null : json["s_city"],
        sState: json["s_state"] == null ? null : json["s_state"],
        sCountry: json["s_country"] == null ? null : json["s_country"],
        sZipcode: json["s_zipcode"] == null ? null : json["s_zipcode"],
        phone: json["phone"] == null ? null : json["phone"],
        email: json["email"] == null ? null : json["email"],
        notes: json["notes"] == null ? null : json["notes"],
        deliveryDate:
            json["delivery_date"] == null ? null : json["delivery_date"],
        deliveryTimeFrom: json["delivery_time_from"] == null
            ? null
            : json["delivery_time_from"],
        deliveryTimeTo:
            json["delivery_time_to"] == null ? null : json["delivery_time_to"],
        // couponCodes: json["coupon_codes"] == null ? null : json["coupon_codes"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "shipping_id": shippingId == null ? null : shippingId,
        "payment_id": paymentId == null ? null : paymentId,
        "profile_id": profileId == null ? null : profileId,
        "total": total == null ? null : total,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "s_address": sAddress == null ? null : sAddress,
        "s_city": sCity == null ? null : sCity,
        "s_state": sState == null ? null : sState,
        "s_country": sCountry == null ? null : sCountry,
        "s_zipcode": sZipcode == null ? null : sZipcode,
        "phone": phone == null ? null : phone,
        "email": email == null ? null : email,
        "notes": notes == null ? null : notes,
        "delivery_date": deliveryDate == null ? null : deliveryDate,
        "delivery_time_from":
            deliveryTimeFrom == null ? null : deliveryTimeFrom,
        "delivery_time_to": deliveryTimeTo == null ? null : deliveryTimeTo,
        // "coupon_codes": couponCodes == null ? null : couponCodes,
      };
}
