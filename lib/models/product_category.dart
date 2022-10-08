// To parse this JSON data, do
//
//     final productCategories = productCategoriesFromJson(jsonString);

import 'dart:convert';

ProductCategories productCategoriesFromJson(String str) =>
    ProductCategories.fromJson(json.decode(str));

String productCategoriesToJson(ProductCategories data) =>
    json.encode(data.toJson());

class ProductCategories {
  ProductCategories({
    required this.categoryName,
    required this.subcategory,
  });

  String categoryName;
  List<String> subcategory;

  factory ProductCategories.fromJson(Map<String, dynamic> json) =>
      ProductCategories(
        categoryName: json["CategoryName"],
        subcategory: List<String>.from(json["Subcategory"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "CategoryName": categoryName,
        "Subcategory": List<dynamic>.from(subcategory.map((x) => x)),
      };
}
