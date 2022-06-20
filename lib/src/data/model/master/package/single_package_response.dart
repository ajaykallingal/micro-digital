// To parse this JSON data, do
//
//     final singlePackageResponse = singlePackageResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SinglePackageResponse singlePackageResponseFromJson(String str) => SinglePackageResponse.fromJson(json.decode(str));

String singlePackageResponseToJson(SinglePackageResponse data) => json.encode(data.toJson());

class SinglePackageResponse {
  SinglePackageResponse({
    required this.basicDetails,
    required this.testList,
    required this.reviewsAndRating,
    required this.reviewPrivillage,
  });

  final List<BasicDetail> basicDetails;
  final List<TestList> testList;
  final List<ReviewsAndRating> reviewsAndRating;
  final bool reviewPrivillage;

  factory SinglePackageResponse.fromJson(Map<String, dynamic> json) => SinglePackageResponse(
    basicDetails: List<BasicDetail>.from(json["basicDetails"].map((x) => BasicDetail.fromJson(x))),
    testList: List<TestList>.from(json["testList"].map((x) => TestList.fromJson(x))),
    reviewsAndRating: List<ReviewsAndRating>.from(json["reviewsAndRating"].map((x) => ReviewsAndRating.fromJson(x))),
    reviewPrivillage: json["reviewPrivillage"],
  );

  Map<String, dynamic> toJson() => {
    "basicDetails": List<dynamic>.from(basicDetails.map((x) => x.toJson())),
    "testList": List<dynamic>.from(testList.map((x) => x.toJson())),
    "reviewsAndRating": List<dynamic>.from(reviewsAndRating.map((x) => x.toJson())),
    "reviewPrivillage": reviewPrivillage,
  };
}

class BasicDetail {
  BasicDetail({
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

  factory BasicDetail.fromJson(Map<String, dynamic> json) => BasicDetail(
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
    imageDir: json["imageDir"],
    popularity: json["popularity"],
    fullDescription: json["full_description"],
    shortDescription: json["short_description"],
    promoText: json["promo_text"],
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
    "imageDir": imageDir,
    "popularity": popularity,
    "full_description": fullDescription,
    "short_description": shortDescription,
    "promo_text": promoText,
    "numberOfTestsInPackage": numberOfTestsInPackage,
  };
}

class ReviewsAndRating {
  ReviewsAndRating({
    required this.productReviewId,
    required this.name,
    required this.advantages,
    required this.disadvantages,
    required this.comment,
    required this.ratingValue,
    required this.voteUp,
    required this.voteDown,
  });

  final String productReviewId;
  final String name;
  final String advantages;
  final String disadvantages;
  final String comment;
  final String ratingValue;
  final String voteUp;
  final String voteDown;

  factory ReviewsAndRating.fromJson(Map<String, dynamic> json) => ReviewsAndRating(
    productReviewId: json["product_review_id"],
    name: json["name"],
    advantages: json["advantages"],
    disadvantages: json["disadvantages"],
    comment: json["comment"],
    ratingValue: json["rating_value"],
    voteUp: json["vote_up"],
    voteDown: json["vote_down"],
  );

  Map<String, dynamic> toJson() => {
    "product_review_id": productReviewId,
    "name": name,
    "advantages": advantages,
    "disadvantages": disadvantages,
    "comment": comment,
    "rating_value": ratingValue,
    "vote_up": voteUp,
    "vote_down": voteDown,
  };
}

class TestList {
  TestList({
    required this.productId,
    required this.listPrice,
    required this.price,
    required this.product,
  });

  final String productId;
  final String listPrice;
  final String price;
  final String product;

  factory TestList.fromJson(Map<String, dynamic> json) => TestList(
    productId: json["product_id"],
    listPrice: json["list_price"],
    price: json["price"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "list_price": listPrice,
    "price": price,
    "product": product,
  };
}
