// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/Functions/googleSignIn.dart';
import 'package:furniture_app/Pages/Mycart/cartpage.dart';
import 'package:furniture_app/Pages/Myfavorite/favoriteProducts.dart';

import 'package:furniture_app/Pages/product_page.dart';
import 'package:furniture_app/naviigation_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  final FocusNode _searchTabFocus = FocusNode();
  final GlobalKey<ScaffoldState> _key = GlobalKey(); //A key for opening drawer
  StoreDataController dataController = Get.find();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Scaffold(
        key: _key,
        resizeToAvoidBottomInset: false,
        drawer: NavigationDrawer(),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.to(() => const Login_screen());

                        _key.currentState!.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        size: MediaQuery.of(context).size.width * 0.12,
                      ),
                    ),
                    Image.asset(biglogo, scale: 3),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => FavoriteProductPage());
                      },
                      child: Icon(
                        Icons.favorite_border,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CartPage());
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: color1,
                  child: TextFormField(
                    autocorrect: true,
                    controller: searchController,
                    focusNode: _searchTabFocus,
                    cursorColor: color6,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: color6,
                      hintText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        color: color6,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: double.infinity,
                height: 40,
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: dataController.categories.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            dataController.categories[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07),
                        ],
                      );
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 220,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://images.pexels.com/photos/276724/pexels-photo-276724.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.25),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "FULL HOUSE SALE",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  shadows: const <Shadow>[
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 10.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.07),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "UPTO",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      shadows: const <Shadow>[
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 10.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                ),
                                Text(
                                  "70% OFF",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      shadows: const <Shadow>[
                                        Shadow(
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 10.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.027,
                        right: MediaQuery.of(context).size.width * 0.02,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.01)),
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Shop Now",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.orange),
                                ),
                                Icon(Icons.arrow_forward,
                                    size: MediaQuery.of(context).size.width *
                                        0.06,
                                    color: Colors.orange)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Popular Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: color1, borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              boxIcons(
                                  height: MediaQuery.of(context).size.height *
                                      0.033,
                                  title: "Sofas",
                                  imageUrl:
                                      "https://www.seekpng.com/png/full/361-3611585_sofa-icon-orange-sofa-icon-png.png"),
                              boxIcons(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  title: "Tv units",
                                  imageUrl:
                                      "https://cdn-icons-png.flaticon.com/512/1189/1189439.png"),
                              boxIcons(
                                  height: MediaQuery.of(context).size.height *
                                      0.032,
                                  title: "Beds",
                                  imageUrl:
                                      "https://www.pngkey.com/png/full/215-2156360_hotel-icon-orange-hotel-icon-png.png")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              boxIcons(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  title: "Cupboard",
                                  imageUrl:
                                      "https://cdn0.iconfinder.com/data/icons/laundry-50/64/Artboard_5-512.png"),
                              boxIcons(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  title: "Decor",
                                  imageUrl:
                                      "https://cdn-icons-png.flaticon.com/512/1175/1175506.png"),
                              boxIcons(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  title: "Drawer",
                                  imageUrl:
                                      "https://cdn-icons-png.flaticon.com/512/2610/2610928.png"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.19,
                    width: MediaQuery.of(context).size.width * 0.21,
                    decoration: BoxDecoration(
                        color: color1, borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.list,
                      size: MediaQuery.of(context).size.width * 0.14,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "New in store",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.315,
              width: MediaQuery.of(context).size.width,
              child: Obx(() => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataController.updatedProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Widget widget = dataController.isloading.isTrue
                          ? const shimmereffect()
                          : GestureDetector(
                              onTap: () {
                                Get.to(() => ProductPage(
                                      product:
                                          dataController.updatedProducts[index],
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: dataController
                                              .updatedProducts[index].id,
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.23,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: CachedNetworkImage(
                                              imageUrl: dataController
                                                  .updatedProducts[index].image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                dataController
                                                    .updatedProducts[index]
                                                    .title,
                                                overflow: TextOverflow.fade,
                                                maxLines: 3,
                                              ),
                                            ),
                                            Text(
                                              "₹${dataController.updatedProducts[index].price.toString()}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );

                      return widget;
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class boxIcons extends StatelessWidget {
  final double height;
  final String title;
  final String imageUrl;
  const boxIcons(
      {super.key,
      required this.height,
      required this.title,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            color: Colors.orange,
          ),
          Text(
            title,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
          )
        ],
      ),
    );
  }
}

Widget skeleton(BuildContext context, double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Colors.grey, borderRadius: BorderRadius.circular(15)),
  );
}

class shimmereffect extends StatelessWidget {
  const shimmereffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 192, 192, 192),
      highlightColor: Color.fromARGB(255, 211, 211, 211),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              skeleton(context, MediaQuery.of(context).size.height * 0.23,
                  MediaQuery.of(context).size.width * 0.4),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      skeleton(
                          context,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.25),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      skeleton(
                          context,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.2),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      skeleton(
                          context,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0.2),
                    ],
                  ),
                  skeleton(context, MediaQuery.of(context).size.height * 0.025,
                      MediaQuery.of(context).size.width * 0.1),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
