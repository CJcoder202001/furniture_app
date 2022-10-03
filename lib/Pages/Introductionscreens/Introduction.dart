import 'package:flutter/material.dart';
import 'package:furniture_app/Pages/Homepage.dart';
import 'package:furniture_app/Pages/check_user_data.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  final List<PageViewModel> introductionPages = <PageViewModel>[
    PageViewModel(
        title: 'Best deal with Huge discounts',
        body:
            'Get best deals with huge discounts at the comfort of your home. Different products with best deals and best prices. Grab them now',
        image: Center(
            child: Image.asset(
          "assets/images/image_1.gif",
          width: 600,
          height: 300,
          fit: BoxFit.cover,
        )),
        //getPageDecoration, a method to customise the page style
        decoration: const PageDecoration(
          imagePadding: EdgeInsets.only(top: 120),
          pageColor: Colors.white,
          bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
          titlePadding: EdgeInsets.only(top: 50),
          bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
        )),
    PageViewModel(
        title: 'Easy to assemble',
        body:
            'The furniture comes in parts according to the design and the structure and the buyer will be provided with a assemble kit and guide to assemble the parts easily. Don\'t worry its very easy to assemle.',
        image: Center(
            child: Image.asset(
          "assets/images/image_3.gif",
          width: 450,
          height: 400,
          fit: BoxFit.cover,
        )),
        //getPageDecoration, a method to customise the page style
        decoration: const PageDecoration(
          imagePadding: EdgeInsets.only(top: 120),
          pageColor: Colors.white,
          bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
          titlePadding: EdgeInsets.only(top: 50),
          bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
        )),
    PageViewModel(
        title: 'At the comfort of your home',
        body:
            'Get the furniture from shop to direct your home. No need to go to various shops to search for the perfect one and skip the process of the time when you have to ring it back home "uff". Search from a collection of 9000+ shops outlets and find the right one.',
        image: Center(
            child: Image.asset(
          "assets/images/image_2.gif",
          width: 450,
          height: 200,
          fit: BoxFit.cover,
        )),
        //getPageDecoration, a method to customise the page style
        decoration: const PageDecoration(
          imagePadding: EdgeInsets.only(top: 120),
          pageColor: Colors.white,
          bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
          titlePadding: EdgeInsets.only(top: 50),
          bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: introductionPages,
      dotsDecorator: getDotsDecorator(),

      key: introKey,
      onDone: () => Get.to(() => const CheckUserData()),
      //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
      scrollPhysics: const ClampingScrollPhysics(),
      showDoneButton: true,
      showNextButton: true,
      showSkipButton: true,
      isBottomSafeArea: true,
      skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
      next: Icon(
        Icons.arrow_forward,
        size: MediaQuery.of(context).size.width * 0.08,
      ),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 12),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
