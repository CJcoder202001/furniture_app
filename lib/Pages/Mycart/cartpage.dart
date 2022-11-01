import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/Functions/razorpay.dart';
import 'package:furniture_app/custom_shapes/customappbar.dart';
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

  double totalPriceOfItems() {
    double total = 0;
    for (int i = 0; i < dataController.cartProducts.length; i++) {
      setState(() {
        total = total + dataController.cartProducts[i].price;
      });
    }
    double avgoftotal = double.parse(total.toStringAsFixed(2));
    return avgoftotal;
  }

  doNothing(BuildContext context, int index) {
    dataController.removefromcart(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              const CustomAppbar(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02),
                child: Center(
                  child: Text(
                    "Cart Products",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ),
              ),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataController.cartProducts.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
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
                          child: ListTile(
                              leading: SizedBox(
                                height: 100,
                                width: 100,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      dataController.cartProducts[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataController.cartProducts[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(dataController.cartProducts[index].price
                                      .toString()),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    dataController.removefromcart(index);
                                    totalPriceOfItems();
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ))),
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
                          print("1");
                          double total = totalPriceOfItems();
                          Get.to(() => RazorPayPayment(totalamount: total));
                          print("2");
                        },
                        icon: const Icon(Icons.shopping_bag),
                        label: Text(
                          "Checkout",
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
