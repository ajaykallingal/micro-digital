// To parse this JSON data, do
//
//     final searchRequest = searchRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchRequest searchRequestFromJson(String str) => SearchRequest.fromJson(json.decode(str));

String searchRequestToJson(SearchRequest data) => json.encode(data.toJson());

class SearchRequest {
  SearchRequest({
    required this.query,
    required this.pageNo,
  });

  final String query;
  final String pageNo;

  factory SearchRequest.fromJson(Map<String, dynamic> json) => SearchRequest(
    query: json["Query"],
    pageNo: json["pageNo"],
  );

  Map<String, dynamic> toJson() => {
    "Query": query,
    "pageNo": pageNo,
  };
}
