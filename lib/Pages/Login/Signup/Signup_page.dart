// ignore_for_file: unused_element

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Functions/firebase.dart';
import 'package:furniture_app/Functions/googleSignIn.dart';
import 'package:furniture_app/Pages/Login/Signup/login_screen.dart';
import 'package:furniture_app/Pages/Verify/verify_email.dart';
import 'package:furniture_app/Pages/check_user_data.dart';
import 'package:furniture_app/custom_shapes/socialcard.dart';
import 'package:get/get.dart';

import 'package:uuid/uuid.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode emailfocus = FocusNode();
  FocusNode mobilefocus = FocusNode();
  FocusNode passwordfocus = FocusNode();
  GoogleSignInController googleSignInController = Get.find();
  FirebaseController firebaseController = Get.find();
  bool isloading = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    emailfocus.dispose();
    mobilefocus.dispose();
    passwordfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        backgroundColor: color2,
        title: Image.asset(logoLocation, scale: 5),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.07),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(221, 95, 95, 95),
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color1,
                      ),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        onFieldSubmitted: (value) {
                          setState(() {
                            nameController.text = value;
                          });
                          FocusScope.of(context).requestFocus(mobilefocus);
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Mobile",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(221, 95, 95, 95),
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color1,
                      ),
                      child: TextFormField(
                        focusNode: mobilefocus,
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {
                          setState(() {
                            phoneNumberController.text = value;
                          });
                          FocusScope.of(context).requestFocus(emailfocus);
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Email ID",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(221, 95, 95, 95),
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color1,
                      ),
                      child: TextFormField(
                          focusNode: emailfocus,
                          controller: emailcontroller,
                          autofillHints: [AutofillHints.email],
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(passwordfocus);
                            setState(() {
                              emailcontroller.text = value;
                            });
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(221, 95, 95, 95),
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color1,
                      ),
                      child: TextFormField(
                          focusNode: passwordfocus,
                          controller: passwordcontroller,
                          obscureText: true,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          onFieldSubmitted: (value) {
                            setState(() {
                              passwordcontroller.text = value;
                            });
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isloading = true;
                          });
                          await firebaseController.firebaseSignin(
                              nameController.text.trim(),
                              phoneNumberController.text.trim(),
                              emailcontroller.text.trim(),
                              passwordcontroller.text.trim(),
                              context);
                          setState(() {
                            isloading = false;
                          });
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 223, 90, 1)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Colors.white)))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: color1,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.055),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Center(
                      child: Text(
                        "Already a member of $appname?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: color6,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.038),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const Login_screen());
                        },
                        child: Text(
                          "Login here",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 223, 90, 1),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.038),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        "Sign up with your socials",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: color6,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.038),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocalCard(
                          icon: "assets/icons/google-icon.svg",
                          press: () async {
                            setState(() {
                              isloading = true;
                            });
                            await googleSignInController.googlesignIn();
                            setState(() {
                              isloading = false;
                            });
                          },
                        ),
                        SocalCard(
                          icon: "assets/icons/facebook-2.svg",
                          press: () {},
                        ),
                        SocalCard(
                          icon: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          isloading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
