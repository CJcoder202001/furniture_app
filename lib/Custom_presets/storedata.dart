// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:furniture_app/models/product_category.dart';
import 'package:furniture_app/models/product_data.dart';

import 'package:furniture_app/models/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StoreDataController extends GetxController {
  RxList<Productdata> favoriteProducts = <Productdata>[].obs;
  RxList<Productdata> OrderedProducts = <Productdata>[].obs;
  RxList<Productdata> cartProducts = <Productdata>[].obs;
  RxList updatedProducts = [].obs;
  RxList categories = [].obs;
  List _categories = [].obs;
  List productsdata = [].obs;
  RxBool isloading = false.obs;
  RxString search = "".obs;

  Future restapidata() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://07b7753f-309a-40b6-a52b-d3b1e0fb934b.mock.pstmn.io/products'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      isloading = true.obs;
      var body = await response.stream.bytesToString();

      ProductDataListResponse productDataListResponse =
          ProductDataListResponse.fromJson(jsonDecode(body));
      productsdata = productDataListResponse.productDataList;

      productsdata.forEach((element) {
        updatedProducts.add(element);
      });

      isloading = false.obs;
    } else {}
  }

  Future<SharedPreferences> get sharedPreferencesinstance async =>
      await SharedPreferences.getInstance();

  addProducttoFavorite(Productdata Product) async {
    SharedPreferences sharedPreferences = await sharedPreferencesinstance;
    List<String> listdata = [];

    favoriteProducts.add(Product);
    favoriteProducts.forEach((element) {
      listdata.add(jsonEncode(element));
    });
    sharedPreferences.remove("favoritelist");
    sharedPreferences.setStringList("favoritelist", listdata);
    // sharedPreferences.clear();
  }

  addProducttocart(Productdata Product) async {
    SharedPreferences sharedPreferences = await sharedPreferencesinstance;
    List<String> listdata = [];

    cartProducts.add(Product);
    cartProducts.forEach((element) {
      listdata.add(jsonEncode(element));
    });
    sharedPreferences.remove("cartlist");
    sharedPreferences.setStringList("cartlist", listdata);
    // sharedPreferences.clear();
  }

  cartToOrder() async {
    SharedPreferences sharedPreferences = await sharedPreferencesinstance;
    List<String> listdata = [];

    cartProducts.forEach((element) {
      listdata.add(jsonEncode(element));
    });

    sharedPreferences.setStringList("Orderlist", listdata);
    print("1st time check: $cartProducts");
    sharedPreferences.remove("cartlist");
    await getorderslistdata();
    await getcartlistdata();
    print("2nd time check: $cartProducts");
    // sharedPreferences.clear();
  }

  removefromcart(int index) async {
    SharedPreferences sharedPreferences = await sharedPreferencesinstance;
    List<String> listdata = [];

    cartProducts.removeAt(index);
    cartProducts.forEach((element) {
      listdata.add(jsonEncode(element));
    });
    sharedPreferences.remove("cartlist");
    sharedPreferences.setStringList("cartlist", listdata);
    // sharedPreferences.clear();
  }

  removefromFavorite(int index) async {
    SharedPreferences sharedPreferences = await sharedPreferencesinstance;
    List<String> listdata = [];

    favoriteProducts.removeAt(index);
    favoriteProducts.forEach((element) {
      listdata.add(jsonEncode(element));
    });
    sharedPreferences.remove("favoritelist");
    sharedPreferences.setStringList("favoritelist", listdata);
    // sharedPreferences.clear();
  }

  getfavoritelistdata() async {
    SharedPreferences sharedPreferences = await sharedPreferencesinstance;
    var listdata = sharedPreferences.getStringList("favoritelist");
    listdata?.forEach((element) {
      favoriteProducts.add(productdataFromJson(element));
    });

    // sharedPreferences.clear();
  }

  getcartlistdata() async {
    SharedPreferences sharedPreferences = await sharedPreferencesinstance;
    var listdata = sharedPreferences.getStringList("cartlist");
    listdata?.forEach((element) {
      cartProducts.add(productdataFromJson(element));
    });

    // sharedPreferences.clear();
  }

  getorderslistdata() async {
    SharedPreferences sharedPreferences = await sharedPreferencesinstance;
    var listdata = sharedPreferences.getStringList("Orderlist");
    listdata?.forEach((element) {
      OrderedProducts.add(productdataFromJson(element));
    });
    // sharedPreferences.clear();
  }

  Future getCategorieslist() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://07b7753f-309a-40b6-a52b-d3b1e0fb934b.mock.pstmn.io/categories'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      _categories = categoriesFromJson(body);
      _categories.forEach((element) {
        categories.add(element);
      });
    } else {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    restapidata();
    getCategorieslist();
    getfavoritelistdata();
    getcartlistdata();
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
