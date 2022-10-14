import 'dart:convert';
import 'dart:io';

import 'package:furniture_app/models/product_category.dart';
import 'package:furniture_app/models/product_data.dart';
import 'package:furniture_app/models/product_data_model.dart';
import 'package:furniture_app/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StoreDataController extends GetxController {
  RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;
  RxList updatedProducts = [].obs;
  List productsdata = [].obs;

  Future restapidata() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://07b7753f-309a-40b6-a52b-d3b1e0fb934b.mock.pstmn.io/products'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();

      ProductDataListResponse productDataListResponse =
          ProductDataListResponse.fromJson(jsonDecode(body));
      productsdata = productDataListResponse.productDataList;

      productsdata.forEach((element) {
        updatedProducts.add(element);
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  addProducttoFavorite(ProductModel Product) {
    favoriteProducts.add(Product);
  }

  removefromFavorite(int index) {
    favoriteProducts.removeAt(index);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    restapidata();
    print(productsdata);
  }
}

const List<String> recommendcategory = [
  "Living room",
  "Bedroom",
  "Kitchen & Dining room",
  "Decoration",
  "Balcony",
  "Garage"
];

final List<ProductModel> newinStoreData = [
  ProductModel(
    itemName: "MaharajaBed",
    price: 7000,
    imageUrl:
        "https://images.pexels.com/photos/1374125/pexels-photo-1374125.jpeg?auto=compress&cs=tinysrgb&w=1600",
  ),
  ProductModel(
    itemName: "OldSofa",
    price: 1000,
    imageUrl:
        "https://images.pexels.com/photos/105004/pexels-photo-105004.jpeg?auto=compress&cs=tinysrgb&w=1600",
  ),
  ProductModel(
    itemName: "DoubleBed",
    price: 7000,
    imageUrl:
        "https://images.pexels.com/photos/3201761/pexels-photo-3201761.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ),
  ProductModel(
    itemName: "ModernSofa",
    price: 7000,
    imageUrl:
        "https://images.pexels.com/photos/2440471/pexels-photo-2440471.jpeg?auto=compress&cs=tinysrgb&w=1600",
  ),
  ProductModel(
    itemName: "ExportedSofa",
    price: 3400,
    imageUrl:
        "https://images.pexels.com/photos/1885562/pexels-photo-1885562.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ),
];

final List<ProductCategories> Newcategory = [
  ProductCategories(
      categoryName: "Sofas",
      subcategory: ["New Sofa", "Old Sofa", "Modern sofa", "Exported Sofa"]),
  ProductCategories(
      categoryName: "Tv & Media Furniture",
      subcategory: ["New Sofa", "Old Sofa", "Modern sofa", "Exported Sofa"]),
  ProductCategories(
      categoryName: "Coffee table",
      subcategory: ["New Sofa", "Old Sofa", "Modern sofa", "Exported Sofa"]),
  ProductCategories(
      categoryName: "Cabinets",
      subcategory: ["New Sofa", "Old Sofa", "Modern sofa", "Exported Sofa"]),
  ProductCategories(
      categoryName: "Bookcase and shelving",
      subcategory: ["New Sofa", "Old Sofa", "Modern sofa", "Exported Sofa"]),
];
