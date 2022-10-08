// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.itemName,
    required this.price,
    required this.imageUrl,
  });

  String itemName;
  int price;
  String imageUrl;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        itemName: json["ItemName"],
        price: json["Price"],
        imageUrl: json["ImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "ItemName": itemName,
        "Price": price,
        "ImageUrl": imageUrl,
      };
}
