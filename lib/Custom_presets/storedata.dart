import 'package:furniture_app/models/product_category.dart';
import 'package:furniture_app/models/product_model.dart';
import 'package:get/get.dart';

class StoreDataController extends GetxController {
  RxList<ProductModel> favoriteProducts = <ProductModel>[].obs;

  addProducttoFavorite(ProductModel Product) {
    favoriteProducts.add(Product);
  }

  removefromFavorite(int index) {
    favoriteProducts.removeAt(index);
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
