// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/Pages/Mycart/cartpage.dart';
import 'package:furniture_app/Pages/Myfavorite/favoriteProducts.dart';

import 'package:furniture_app/Pages/product_page.dart';
import 'package:furniture_app/Pages/shopnowpage.dart';
import 'package:furniture_app/custom_shapes/box_icons.dart';
import 'package:furniture_app/custom_shapes/shimmereffect.dart';
import 'package:furniture_app/naviigation_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

  List<boxIcons> icontray = const [
    boxIcons(
        title: "Skirts",
        imageUrl:
            "https://cdn1.iconfinder.com/data/icons/vibrancie-clothes/30/clothes_002-dress-girl-women-fashion-garment-512.png"),
    boxIcons(
        title: "Boy's tees",
        imageUrl:
            "https://cdn3.iconfinder.com/data/icons/country-flags-shirts-geometric-simplification/345/flag-country-shirt-jersey_244-512.png"),
    boxIcons(
        title: "Gown's",
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/03/24/13/40/dress-293977_1280.png"),
    boxIcons(
        title: "Cupboard",
        imageUrl:
            "https://cdn0.iconfinder.com/data/icons/laundry-50/64/Artboard_5-512.png"),
    boxIcons(
        title: "Decor",
        imageUrl: "https://cdn-icons-png.flaticon.com/512/1175/1175506.png"),
    boxIcons(
        title: "Drawer",
        imageUrl: "https://cdn-icons-png.flaticon.com/512/2610/2610928.png")
  ];

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
        drawer: const NavigationDrawer(),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
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
                          Get.to(() => const FavoriteProductPage());
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
                      onChanged: (value) {
                        dataController.search = value.obs;
                        if (value.isNotEmpty) {
                          Get.to(() => ShopNowPage());
                        }
                      },
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
                                width:
                                    MediaQuery.of(context).size.width * 0.07),
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
                                        MediaQuery.of(context).size.width *
                                            0.07),
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
                          child: GestureDetector(
                            onTap: () => Get.to(() => ShopNowPage()),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width *
                                          0.01)),
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
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        color: Colors.orange)
                                  ],
                                ),
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
                      height: MediaQuery.of(context).size.height * 0.225,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: MediaQuery.of(context)
                                            .size
                                            .height *
                                        0.0001,
                                    mainAxisExtent:
                                        MediaQuery.of(context).size.width *
                                            0.2),
                            shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return icontray[index];
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.225,
                      width: MediaQuery.of(context).size.width * 0.21,
                      decoration: BoxDecoration(
                          color: color1,
                          borderRadius: BorderRadius.circular(15)),
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
                      cacheExtent: 10,
                      itemBuilder: (context, index) {
                        Widget widget = dataController.isloading.isTrue
                            ? const shimmereffect()
                            : GestureDetector(
                                onTap: () {
                                  Get.to(() => ProductPage(
                                        product: dataController
                                            .updatedProducts[index],
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
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
                                                    .updatedProducts[index]
                                                    .image,
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
      ),
    );
  }
}
