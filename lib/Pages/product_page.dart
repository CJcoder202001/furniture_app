import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';

import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/Pages/Myfavorite/favoriteProducts.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  final String imageurl;

  final int price;

  final String productname;

  final currentindex;

  const ProductPage(
      {Key? key,
      required this.imageurl,
      required this.productname,
      required this.currentindex,
      required this.price})
      : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //Variable to add or remove item from favorite list
  bool isfavorite = false;

  int colorcurrentindex = 0;

  StoreDataController dataController = Get.find();

  List<Color> colors = [
    Colors.brown,
    Colors.grey,
    Colors.red,
    Colors.yellow,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                    Image.asset(biglogo,
                        scale: MediaQuery.of(context).size.width * 0.01),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    GestureDetector(
                      onTap: () => Get.to(() => const FavoriteProductPage()),
                      child: Icon(
                        Icons.favorite_border,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              widget.productname,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Hero(
                    tag: widget.imageurl,
                    child: CachedNetworkImage(
                      imageUrl: widget.imageurl,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹${widget.price.toString()}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.1,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text("Emi from ₹3598"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Limited Time Price",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.025),
                                ),
                              ),
                              Obx(
                                (() => InkWell(
                                      onTap: () {
                                        print(widget.currentindex);

                                        int index = dataController
                                            .favoriteProducts
                                            .indexWhere((element) =>
                                                element.itemName ==
                                                newinStoreData[widget.currentindex]
                                                    .itemName);
                                        index == -1
                                            ? {
                                                dataController
                                                    .addProducttoFavorite(
                                                        newinStoreData[
                                                            widget.currentindex])
                                              }
                                            : {
                                                dataController
                                                    .removefromFavorite(index)
                                              };
                                      },
                                      child: Icon(
                                        dataController.favoriteProducts
                                                .contains(newinStoreData[
                                                    widget.currentindex])
                                            ? Icons.favorite_outlined
                                            : Icons.favorite_border_outlined,
                                        color: Colors.orange,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Colours",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              colorcurrentindex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: colorcurrentindex == index
                                    ? MediaQuery.of(context).size.height * 0.16
                                    : MediaQuery.of(context).size.height * 0.15,
                                width: colorcurrentindex == index
                                    ? MediaQuery.of(context).size.width * 0.16
                                    : MediaQuery.of(context).size.width * 0.15,
                                decoration: BoxDecoration(
                                    color: colors[index],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      colorcurrentindex == index
                                          ? const BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 80, 80, 80),
                                              blurRadius: 10.0,
                                            )
                                          : const BoxShadow(),
                                    ])),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.white,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: GoogleFonts.workSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Qty : "),
                                Text("1"),
                                Icon(Icons.arrow_downward),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.01),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.64,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Add to cart",
                                      style: GoogleFonts.workSans(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: color2,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
