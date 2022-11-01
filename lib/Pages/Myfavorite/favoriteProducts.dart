import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/custom_shapes/customappbar.dart';
import 'package:get/get.dart';

class FavoriteProductPage extends StatefulWidget {
  const FavoriteProductPage({super.key});

  @override
  State<FavoriteProductPage> createState() => _FavoriteProductPageState();
}

class _FavoriteProductPageState extends State<FavoriteProductPage> {
  StoreDataController dataController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPriceOfItems();
  }

  double totalPriceOfItems() {
    double total = 0;
    for (int i = 0; i < dataController.favoriteProducts.length; i++) {
      setState(() {
        total = total + dataController.favoriteProducts[i].price;
      });
    }
    double avgoftotal = double.parse(total.toStringAsFixed(2));
    return avgoftotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const CustomAppbar(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                child: Center(
                  child: Text(
                    "Favorite Products",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ),
              ),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dataController.favoriteProducts.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.03,
                            vertical:
                                MediaQuery.of(context).size.height * 0.006),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Obx(
                            () => ListTile(
                                leading: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: CachedNetworkImage(
                                    imageUrl: dataController
                                        .favoriteProducts[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dataController
                                          .favoriteProducts[index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(dataController
                                        .favoriteProducts[index].price
                                        .toString()),
                                  ],
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      int itemindex = dataController
                                          .favoriteProducts
                                          .indexWhere((element) =>
                                              element.id ==
                                              dataController
                                                  .favoriteProducts[index].id);
                                      itemindex == -1
                                          ? {
                                              dataController
                                                  .addProducttoFavorite(
                                                      dataController
                                                              .favoriteProducts[
                                                          index])
                                            }
                                          : {
                                              dataController
                                                  .removefromFavorite(itemindex)
                                            };
                                      totalPriceOfItems();
                                    },
                                    icon: dataController.favoriteProducts
                                            .contains(dataController
                                                .favoriteProducts[index])
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.orange,
                                          )
                                        : const Icon(
                                            Icons.favorite_border,
                                            color: Colors.orange,
                                          ))),
                          ),
                        ),
                      );
                    },
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 1,
              right: 1,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.02,
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(totalPriceOfItems().toString())
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.9,
                                MediaQuery.of(context).size.height * 0.05)),
                        onPressed: () {
                          try {
                            dataController.favoriteProducts.forEach((element) {
                              dataController.addProducttocart(element);
                            });
                            Flushbar(
                              title: "Added to cart",
                              message: "The following items are added to cart",
                              duration: const Duration(seconds: 3),
                              margin: const EdgeInsets.all(8),
                              borderRadius: BorderRadius.circular(8),
                              icon: const Icon(
                                Icons.check,
                                color: Colors.greenAccent,
                              ),
                            ).show(context);
                          } catch (error) {
                            print(error);
                          }
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: Text(
                          "Add to cart",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06),
                        )),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
