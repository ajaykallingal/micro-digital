// To parse this JSON data, do
//
//     final categoriesRequest = categoriesRequestFromJson(jsonString);

import 'dart:convert';

CategoriesRequest categoriesRequestFromJson(String str) =>
    CategoriesRequest.fromJson(json.decode(str));

String categoriesRequestToJson(CategoriesRequest data) =>
    json.encode(data.toJson());

class CategoriesRequest {
  CategoriesRequest({
    required this.query,
    required this.pageNo,
  });

  final String query;
  final String pageNo;

  factory CategoriesRequest.fromJson(Map<String, dynamic> json) =>
      CategoriesRequest(
        query: json["Query"] == null ? null : json["Query"],
        pageNo: json["pageNo"] == null ? null : json["pageNo"],
      );

  Map<String, dynamic> toJson() => {
        "Query": query == null ? null : query,
        "pageNo": pageNo == null ? null : pageNo,
      };
}
