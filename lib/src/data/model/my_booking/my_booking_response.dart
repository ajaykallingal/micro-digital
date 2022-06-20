// To parse this JSON data, do
//
//     final myBookingResponse = myBookingResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyBookingResponse myBookingResponseFromJson(String str) => MyBookingResponse.fromJson(json.decode(str));

String myBookingResponseToJson(MyBookingResponse data) => json.encode(data.toJson());

class MyBookingResponse {
  MyBookingResponse({
    required this.bookingHistory,
    required this.totalPages,
  });

  final List<BookingHistory>? bookingHistory;
  final int totalPages;

  factory MyBookingResponse.fromJson(Map<String, dynamic> json) => MyBookingResponse(
    bookingHistory: json["bookingHistory"] == null ? null : List<BookingHistory>.from(json["bookingHistory"].map((x) => BookingHistory.fromJson(x))),
    totalPages: json["totalPages"] == null ? null : json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "bookingHistory": bookingHistory == null ? null : List<dynamic>.from(bookingHistory!.map((x) => x.toJson())),
    "totalPages": totalPages == null ? null : totalPages,
  };
}

class BookingHistory {
  BookingHistory({
    required this.orderId,
    required this.total,
    required this.subtotal,
    required this.discount,
    required this.subtotalDiscount,
    required this.timestamp,
    required this.notes,
    required this.firstname,
    required this.lastname,
    required this.sFirstname,
    required this.sLastname,
    required this.sAddress,
    required this.sCity,
    required this.sAddress2,
    required this.sCounty,
    required this.sState,
    required this.sCountry,
    required this.sZipcode,
    required this.sPhone,
    required this.paymentId,
    required this.deliveryDate,
    required this.deliveryTimeFrom,
    required this.deliveryTimeTo,
    required this.deliveryMessage,
    required this.updatedAt,
    required this.status,
  });

  final String orderId;
  final String total;
  final String subtotal;
  final String discount;
  final String subtotalDiscount;
  final String timestamp;
  final String notes;
  final String firstname;
  final String lastname;
  final String sFirstname;
  final String sLastname;
  final String sAddress;
  final String sCity;
  final String sAddress2;
  final String sCounty;
  final String sState;
  final String sCountry;
  final String sZipcode;
  final String sPhone;
  final String paymentId;
  final String deliveryDate;
  final String deliveryTimeFrom;
  final String deliveryTimeTo;
  final dynamic deliveryMessage;
  final String updatedAt;
  final String status;

  factory BookingHistory.fromJson(Map<String, dynamic> json) => BookingHistory(
    orderId: json["order_id"] == null ? null : json["order_id"],
    total: json["total"] == null ? null : json["total"],
    subtotal: json["subtotal"] == null ? null : json["subtotal"],
    discount: json["discount"] == null ? null : json["discount"],
    subtotalDiscount: json["subtotal_discount"] == null ? null : json["subtotal_discount"],
    timestamp: json["timestamp"] == null ? null : json["timestamp"],
    notes: json["notes"] == null ? null : json["notes"],
    firstname: json["firstname"] == null ? null : json["firstname"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    sFirstname: json["s_firstname"] == null ? null : json["s_firstname"],
    sLastname: json["s_lastname"] == null ? null : json["s_lastname"],
    sAddress: json["s_address"] == null ? null : json["s_address"],
    sCity: json["s_city"] == null ? null : json["s_city"],
    sAddress2: json["s_address_2"] == null ? null : json["s_address_2"],
    sCounty: json["s_county"] == null ? null : json["s_county"],
    sState: json["s_state"] == null ? null : json["s_state"],
    sCountry: json["s_country"] == null ? null : json["s_country"],
    sZipcode: json["s_zipcode"] == null ? null : json["s_zipcode"],
    sPhone: json["s_phone"] == null ? null : json["s_phone"],
    paymentId: json["payment_id"] == null ? null : json["payment_id"],
    deliveryDate: json["delivery_date"] == null ? null : json["delivery_date"],
    deliveryTimeFrom: json["delivery_time_from"] == null ? null : json["delivery_time_from"],
    deliveryTimeTo: json["delivery_time_to"] == null ? null : json["delivery_time_to"],
    deliveryMessage: json["delivery_message"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId == null ? null : orderId,
    "total": total == null ? null : total,
    "subtotal": subtotal == null ? null : subtotal,
    "discount": discount == null ? null : discount,
    "subtotal_discount": subtotalDiscount == null ? null : subtotalDiscount,
    "timestamp": timestamp == null ? null : timestamp,
    "notes": notes == null ? null : notes,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "s_firstname": sFirstname == null ? null : sFirstname,
    "s_lastname": sLastname == null ? null : sLastname,
    "s_address": sAddress == null ? null : sAddress,
    "s_city": sCity == null ? null : sCity,
    "s_address_2": sAddress2 == null ? null : sAddress2,
    "s_county": sCounty == null ? null : sCounty,
    "s_state": sState == null ? null : sState,
    "s_country": sCountry == null ? null : sCountry,
    "s_zipcode": sZipcode == null ? null : sZipcode,
    "s_phone": sPhone == null ? null : sPhone,
    "payment_id": paymentId == null ? null : paymentId,
    "delivery_date": deliveryDate == null ? null : deliveryDate,
    "delivery_time_from": deliveryTimeFrom == null ? null : deliveryTimeFrom,
    "delivery_time_to": deliveryTimeTo == null ? null : deliveryTimeTo,
    "delivery_message": deliveryMessage,
    "updated_at": updatedAt == null ? null : updatedAt,
    "status": status == null ? null : status,
  };
}
