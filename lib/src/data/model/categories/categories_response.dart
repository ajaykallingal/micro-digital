// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) =>
    CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) =>
    json.encode(data.toJson());

class CategoriesResponse {
  CategoriesResponse({
    required this.packages,
    required this.totalPages,
  });

  final List<Package>? packages;
  final int totalPages;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        packages: json["packages"] == null
            ? null
            : List<Package>.from(
                json["packages"].map((x) => Package.fromJson(x))),
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "packages": packages == null
            ? null
            : List<dynamic>.from(packages!.map((x) => x.toJson())),
        "totalPages": totalPages == null ? null : totalPages,
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
    required this.imageDir,
    required this.popularity,
    required this.fullDescription,
    required this.shortDescription,
    required this.promoText,
    required this.numberOfTestsInPackage,
    required this.isPackage,
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
  final String imageDir;
  final String popularity;
  final String fullDescription;
  final String shortDescription;
  final String promoText;
  final String isPackage;
  final int numberOfTestsInPackage;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        productId: json["product_id"] == null ? null : json["product_id"],
        productCode: json["product_code"] == null ? null : json["product_code"],
        listPrice: json["list_price"] == null ? null : json["list_price"],
        price: json["price"] == null ? null : json["price"],
        product: json["product"] == null ? null : json["product"],
        stock: json["stock"] == null ? null : json["stock"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        amount: json["amount"] == null ? null : json["amount"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        idPath: json["id_path"] == null ? null : json["id_path"],
        category: json["category"] == null ? null : json["category"],
        imageDir: json["imageDir"] == null ? null : json["imageDir"],
        popularity: json["popularity"] == null ? null : json["popularity"],
        fullDescription:
            json["full_description"] == null ? null : json["full_description"],
        shortDescription: json["short_description"] == null
            ? null
            : json["short_description"],
        promoText: json["promo_text"] == null ? null : json["promo_text"],
        numberOfTestsInPackage: json["numberOfTestsInPackage"] == null
            ? null
            : json["numberOfTestsInPackage"],
        isPackage: json["IsPackage"] == null ? null : json["IsPackage"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product_code": productCode == null ? null : productCode,
        "list_price": listPrice == null ? null : listPrice,
        "price": price == null ? null : price,
        "product": product == null ? null : product,
        "stock": stock == null ? null : stock,
        "category_id": categoryId == null ? null : categoryId,
        "amount": amount == null ? null : amount,
        "parent_id": parentId == null ? null : parentId,
        "id_path": idPath == null ? null : idPath,
        "category": category == null ? null : category,
        "imageDir": imageDir == null ? null : imageDir,
        "popularity": popularity == null ? null : popularity,
        "full_description": fullDescription == null ? null : fullDescription,
        "short_description": shortDescription == null ? null : shortDescription,
        "promo_text": promoText == null ? null : promoText,
        "numberOfTestsInPackage":
            numberOfTestsInPackage == null ? null : numberOfTestsInPackage,
        "IsPackage": isPackage == null ? null : isPackage,
      };
}
