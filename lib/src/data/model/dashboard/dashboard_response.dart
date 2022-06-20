// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) => DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) => json.encode(data.toJson());

class DashboardResponse {
  DashboardResponse({
    required this.banners,
    required this.latest,
    required this.riskAreas,
    required this.categoryList,
    required this.activeScreeningTypes,
    required this.popular,
  });

  final List<Banner> banners;
  final List<Latest> latest;
  final List<CategoryList> riskAreas;
  final List<CategoryList> categoryList;
  final List<ActiveScreeningType> activeScreeningTypes;
  final List<Latest> popular;

  factory DashboardResponse.fromJson(Map<String, dynamic> json) => DashboardResponse(
    banners: json["banners"] = List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    latest: json["latest"] = List<Latest>.from(json["latest"].map((x) => Latest.fromJson(x))),
    riskAreas: json["riskAreas"] = List<CategoryList>.from(json["riskAreas"].map((x) => CategoryList.fromJson(x))),
    categoryList: json["categoryList"] =List<CategoryList>.from(json["categoryList"].map((x) => CategoryList.fromJson(x))),
    activeScreeningTypes: json["activeScreeningTypes"] = List<ActiveScreeningType>.from(json["activeScreeningTypes"].map((x) => ActiveScreeningType.fromJson(x))),
    popular: json["popular"] =List<Latest>.from(json["popular"].map((x) => Latest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "latest": List<dynamic>.from(latest.map((x) => x.toJson())),
    "riskAreas": List<dynamic>.from(riskAreas.map((x) => x.toJson())),
    "categoryList": List<dynamic>.from(categoryList.map((x) => x.toJson())),
    "activeScreeningTypes": List<dynamic>.from(activeScreeningTypes.map((x) => x.toJson())),
    "popular": List<dynamic>.from(popular.map((x) => x.toJson())),
  };
}

class ActiveScreeningType {
  ActiveScreeningType({
    required this.id,
    required this.name,
    required this.image,
  });

  final String id;
  final String name;
  final String image;

  factory ActiveScreeningType.fromJson(Map<String, dynamic> json) => ActiveScreeningType(
    id: json["id"] == null ? null : json["id"],
    name: json["Name"] == null ? null : json["Name"],
    image: json["Image"] == null ? null : json["Image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "Name": name == null ? null : name,
    "Image": image == null ? null : image,
  };
}

class Banner {
  Banner({
    required this.bannerId,
    required this.productList,
    required this.categoryList,
    required this.imageDir,
  });

  final String bannerId;
  final String productList;
  final String categoryList;
  final String imageDir;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    bannerId: json["banner_id"] == null ? null : json["banner_id"],
    productList: json["ProductList"] == null ? null : json["ProductList"],
    categoryList: json["CategoryList"] == null ? null : json["CategoryList"],
    imageDir: json["imageDir"] == null ? null : json["imageDir"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId == null ? null : bannerId,
    "ProductList": productList == null ? null : productList,
    "CategoryList": categoryList == null ? null : categoryList,
    "imageDir": imageDir == null ? null : imageDir,
  };
}

class CategoryList {
  CategoryList({
    required this.categoryId,
    required this.category,
    required this.imageDir,
  });

  final String categoryId;
  final String category;
  final String imageDir;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    categoryId: json["category_id"] == null ? null : json["category_id"],
    category: json["category"] == null ? null : json["category"],
    imageDir: json["imageDir"] == null ? null : json["imageDir"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId == null ? null : categoryId,
    "category": category == null ? null : category,
    "imageDir": imageDir == null ? null : imageDir,
  };
}

class Latest {
  Latest({
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
  final int numberOfTestsInPackage;

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
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
    fullDescription: json["full_description"] == null ? null : json["full_description"],
    shortDescription: json["short_description"] == null ? null : json["short_description"],
    promoText: json["promo_text"] == null ? null : json["promo_text"],
    numberOfTestsInPackage: json["numberOfTestsInPackage"] == null ? null : json["numberOfTestsInPackage"],
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
    "numberOfTestsInPackage": numberOfTestsInPackage == null ? null : numberOfTestsInPackage,
  };
}
