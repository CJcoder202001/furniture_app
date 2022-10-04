import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  StoreDataController dataController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPriceOfItems();
  }

  int totalPriceOfItems() {
    int total = 0;
    for (int i = 0; i < dataController.favoriteProducts.length; i++) {
      setState(() {
        total = total + dataController.favoriteProducts[i].price;
      });
    }
    return total;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width*0.05,
        title: Image.asset(biglogo,
            scale: MediaQuery.of(context).size.width * 0.01),
        backgroundColor: Colors.white,
        actions: [
          Icon(
            Icons.search,
            size: MediaQuery.of(context).size.width * 0.07,
            color: Colors.black,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Icon(
            Icons.favorite_border,
            size: MediaQuery.of(context).size.width * 0.07,
            color: Colors.black,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Icon(
            Icons.shopping_cart_outlined,
            size: MediaQuery.of(context).size.width * 0.07,
            color: Colors.black,
          ),
        ],
      ),
      body: Stack(
        children: [
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

                      decoration: BoxDecoration( color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.02,
                            vertical: MediaQuery.of(context).size.height * 0.01),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04,fontWeight: FontWeight.bold),),
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
                        onPressed: () {},
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
          Column(
            children: [
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
                                    .favoriteProducts[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataController
                                      .favoriteProducts[index].itemName,
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
                                  element.itemName ==
                                      dataController
                                          .favoriteProducts[index]
                                          .itemName);
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
            ],
          ),
        ],
      ),
    );
  }
}
