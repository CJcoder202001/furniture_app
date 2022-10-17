// To parse this JSON data, do
//
//     final productdata = productdataFromJson(jsonString);

import 'dart:convert';

Productdata productdataFromJson(String str) =>
    Productdata.fromJson(json.decode(str));

String productdataToJson(Productdata data) => json.encode(data.toJson());

class ProductDataListResponse {
  final List<Productdata> productDataList;

  ProductDataListResponse(this.productDataList);

//from JSON
  factory ProductDataListResponse.fromJson(List<dynamic> parsedJson) {
    List<Productdata> productDataList = [];
    productDataList = parsedJson.map((i) => Productdata.fromJson(i)).toList();
    return new ProductDataListResponse(productDataList);
  }
//to JSON
  Map<String, dynamic> toJson() => {
        'productDataList': productDataList,
      };
}

class Productdata {
  Productdata({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  factory Productdata.fromJson(Map<String, dynamic> json) => Productdata(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
      };
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

List<String> categoriesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoriesToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
