// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';

import 'package:furniture_app/Pages/product_page.dart';
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

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final List<String> recommendcategory = const [
    "Living room",
    "Bedroom",
    "Kitchen & Dining room",
    "Decoration",
    "Balcony",
    "Garage"
  ];

  final List<Map> NewinStoreData = [
    {
      "ItemName": "MaharajaBed",
      "Price": 7000,
      "ImageUrl":
          "https://images.pexels.com/photos/1374125/pexels-photo-1374125.jpeg?auto=compress&cs=tinysrgb&w=1600"
    },
    {
      "ItemName": "OldSofa",
      "Price": 1000,
      "ImageUrl":
          "https://images.pexels.com/photos/105004/pexels-photo-105004.jpeg?auto=compress&cs=tinysrgb&w=1600"
    },
    {
      "ItemName": "DoubleBed",
      "Price": 7000,
      "ImageUrl":
          "https://images.pexels.com/photos/3201761/pexels-photo-3201761.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
    {
      "ItemName": "ModernSofa",
      "Price": 1200,
      "ImageUrl":
          "https://images.pexels.com/photos/2440471/pexels-photo-2440471.jpeg?auto=compress&cs=tinysrgb&w=1600"
    },
    {
      "ItemName": "ExportedSofa",
      "Price": 3400,
      "ImageUrl":
          "https://images.pexels.com/photos/1885562/pexels-photo-1885562.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Scaffold(
        key: _key,
        resizeToAvoidBottomInset: false,
        drawer: const NavigationDrawer(),
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
                    Image.asset(logoLocation, scale: 8),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: MediaQuery.of(context).size.width * 0.07,
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
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: recommendcategory.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        recommendcategory[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                    ],
                  );
                },
              ),
            ),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://www.seekpng.com/png/full/361-3611585_sofa-icon-orange-sofa-icon-png.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.033,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "Sofas",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn-icons-png.flaticon.com/512/1189/1189439.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "Tv units",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://www.pngkey.com/png/full/215-2156360_hotel-icon-orange-hotel-icon-png.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.032,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "Beds",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn0.iconfinder.com/data/icons/laundry-50/64/Artboard_5-512.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "Cupboard",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn-icons-png.flaticon.com/512/1175/1175506.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "Decor",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "https://cdn-icons-png.flaticon.com/512/2610/2610928.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "Drawer",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03),
                                    )
                                  ],
                                ),
                              ),
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
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                addRepaintBoundaries: true,
                itemCount: NewinStoreData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ProductPage(
                          imageurl: NewinStoreData[index]["ImageUrl"],
                          productname: NewinStoreData[index]["ItemName"],
                          price: NewinStoreData[index]["Price"]));
                    },
                    child: Hero(
                      tag: NewinStoreData[index]["ImageUrl"],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.28,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: CachedNetworkImage(
                                    imageUrl: NewinStoreData[index]["ImageUrl"],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(NewinStoreData[index]["ItemName"]),
                                    const Spacer(),
                                    Text(
                                      "₹${NewinStoreData[index]["Price"].toString()}",
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
