import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/storedata.dart';
import 'package:furniture_app/Pages/Homepage.dart';
import 'package:furniture_app/Pages/Mycart/cartpage.dart';
import 'package:furniture_app/Pages/error.dart';
import 'package:furniture_app/Pages/orderedpage.dart';
import 'package:furniture_app/custom_shapes/showicon.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:spring/spring.dart';

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
    // // Get.to(() => const ShowIcon(
    //     iconpath: "assets/Lottie/order-completed.gif",
    //     message: "Yaay! Payment has been made!"));

    await controller.cartToOrder();
    Get.to(() => const OrderedPage());
    print(" success response: $response");
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    // Do something when payment fails
    Get.to(() => const ErrorPage(false));
    await Future.delayed(const Duration(seconds: 3));
    Get.to(() => const Homepage());

    print(" failure response: $response");
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
                  'amount': (widget.totalamount * 100),
                  'name': 'Furniture app',
                  'description': 'Product Order',
                  'retry': {'enabled': true, 'max_count': 1},
                  'send_sms_hash': true,
                  'prefill': {
                    'contact': '7669486618',
                    'email': 'videoeditsbycj@gmail.com'
                  },
                  'external': {
                    'wallets': ['paytm']
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
