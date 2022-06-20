// To parse this JSON data, do
//
//     final searchPackageResponse = searchPackageResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchPackageResponse searchPackageResponseFromJson(String str) => SearchPackageResponse.fromJson(json.decode(str));

String searchPackageResponseToJson(SearchPackageResponse data) => json.encode(data.toJson());

class SearchPackageResponse {
  SearchPackageResponse({
    required this.packages,
  });

  final List<Package> packages;

  factory SearchPackageResponse.fromJson(Map<String, dynamic> json) => SearchPackageResponse(
    packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
  };
}

class Package {
  Package({
    required this.productId,
    required this.productCode,
    required this.listPrice,
    required this.price,
    required this.product,
    required this.stock,
    required this.categoryId,
    required this.amount,
    required this.parentId,
    required this.idPath,
    required this.category,
    required this.popularity,
    required this.fullDescription,
    required this.shortDescription,
    required this.promoText,
    required this.imageDir,
    required this.numberOfTestsInPackage,
  });

  final String productId;
  final String productCode;
  final String listPrice;
  final String price;
  final String product;
  final String stock;
  final String categoryId;
  final String amount;
  final String parentId;
  final String idPath;
  final String category;
  final String popularity;
  final String fullDescription;
  final String shortDescription;
  final String promoText;
  final String imageDir;
  final int numberOfTestsInPackage;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    productId: json["product_id"],
    productCode: json["product_code"],
    listPrice: json["list_price"],
    price: json["price"],
    product: json["product"],
    stock: json["stock"],
    categoryId: json["category_id"],
    amount: json["amount"],
    parentId: json["parent_id"],
    idPath: json["id_path"],
    category: json["category"],
    popularity: json["popularity"],
    fullDescription: json["full_description"],
    shortDescription: json["short_description"],
    promoText: json["promo_text"],
    imageDir: json["imageDir"],
    numberOfTestsInPackage: json["numberOfTestsInPackage"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_code": productCode,
    "list_price": listPrice,
    "price": price,
    "product": product,
    "stock": stock,
    "category_id": categoryId,
    "amount": amount,
    "parent_id": parentId,
    "id_path": idPath,
    "category": category,
    "popularity": popularity,
    "full_description": fullDescription,
    "short_description": shortDescription,
    "promo_text": promoText,
    "imageDir": imageDir,
    "numberOfTestsInPackage": numberOfTestsInPackage,
  };
}
