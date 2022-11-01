import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/Pages/Mycart/cartpage.dart';
import 'package:furniture_app/Pages/orderedpage.dart';
import 'package:furniture_app/custom_shapes/showicon.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPayment extends StatefulWidget {
  final double totalamount;
  const RazorPayPayment({super.key, required this.totalamount});

  @override
  State<RazorPayPayment> createState() => _RazorPayPaymentState();
}

class _RazorPayPaymentState extends State<RazorPayPayment> {
  final Razorpay _razorpay = Razorpay();
  StoreDataController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    const ShowIcon(
        iconpath: "assets/Lottie/order-completed.gif",
        message: "Yaay! Payment has been made!");
    controller.cartToOrder();
    await Future.delayed(const Duration(seconds: 3));
    Get.to(() => const OrderedPage());
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    // Do something when payment fails
    const ShowIcon(
        iconpath: "assets/Lottie/connection-error.gif",
        message: "OOPS! Something went wrong! Try again later");
    await Future.delayed(const Duration(seconds: 3));
    Get.back();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Your total is:"),
          Text(widget.totalamount.toString()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ElevatedButton.icon(
              onPressed: () {
                var options = {
                  'key': 'rzp_test_Fp9dwVwgjgskpM',
                  'amount': (widget.totalamount *
                      100), //in the smallest currency sub-unit.
                  'name': 'Furniture app',
                  'order_id':
                      'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                  'description': 'Product Order',
                  'timeout': 300, // in seconds
                  'prefill': {
                    'contact': '766948618',
                    'email': 'videoeditsbycj@gmail.com'
                  }
                };

                _razorpay.open(options);
              },
              icon: const Icon(Icons.payment),
              label: const Text("Pay with RazorPay"))
        ],
      ),
    ));
  }
}
