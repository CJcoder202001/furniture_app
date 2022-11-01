import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/custom_shapes/customappbar.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  OrderPage({super.key});
  StoreDataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: ListView(
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
                itemCount: dataController.OrderedProducts.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                        vertical: MediaQuery.of(context).size.height * 0.006),
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
                                imageUrl:
                                    dataController.OrderedProducts[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataController.OrderedProducts[index].title,
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
                                              .OrderedProducts[index].id);
                                  itemindex == -1
                                      ? {
                                          dataController.addProducttoFavorite(
                                              dataController
                                                  .OrderedProducts[index])
                                        }
                                      : {
                                          dataController
                                              .removefromFavorite(itemindex)
                                        };
                                },
                                icon: dataController.favoriteProducts.contains(
                                        dataController.OrderedProducts[index])
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
    ));
  }
}
