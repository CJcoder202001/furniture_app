import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/Pages/product_page.dart';
import 'package:furniture_app/custom_shapes/customappbar.dart';
import 'package:get/get.dart';

class ShopNowPage extends StatelessWidget {
  ShopNowPage({super.key});
  StoreDataController dataController = Get.find();
  TextEditingController searchController = TextEditingController();
  final FocusNode _searchTabFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    searchController.text = dataController.search.value;
    return Material(
      child: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              const CustomAppbar(),
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.05,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.height * 0.02,
                      childAspectRatio:
                          MediaQuery.of(context).size.aspectRatio * 1.2),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: dataController.updatedProducts.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => ProductPage(
                            product: dataController.updatedProducts[index],
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: dataController.updatedProducts[index].id,
                              child: CachedNetworkImage(
                                imageUrl:
                                    dataController.updatedProducts[index].image,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      dataController
                                          .updatedProducts[index].title,
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
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
