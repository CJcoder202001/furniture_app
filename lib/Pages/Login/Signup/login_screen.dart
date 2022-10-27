import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Custom_presets/colors_preset.dart';
import 'package:furniture_app/Functions/firebase.dart';
import 'package:furniture_app/Functions/googleSignIn.dart';
import 'package:furniture_app/Pages/Login/Signup/Signup_page.dart';
import 'package:furniture_app/Pages/check_User_Data.dart';

import 'package:furniture_app/custom_shapes/socialcard.dart';
import 'package:get/get.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  FocusNode passwordfocus = FocusNode();

  GoogleSignInController googleController = Get.put(GoogleSignInController());
  FirebaseController firebaseController = Get.put(FirebaseController());
  bool isloading = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    Passwordcontroller.dispose();
    passwordfocus.dispose();
    super.dispose();
  }

  void validateAndSave() async {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: Passwordcontroller.text.trim());

        Get.to(() => const CheckUserData());
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          dismissDirection: DismissDirection.down,
          content: AwesomeSnackbarContent(
            title: 'Error',
            message: error.toString(),
            contentType: ContentType.warning,
          ),
        ));
      }
    } else {
      print('Form is invalid');
    }
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
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.07),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          controller: emailcontroller,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          autofillHints: [AutofillHints.email],
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).requestFocus(passwordfocus);
                            setState(() {
                              emailcontroller.text = value;
                            });
                          },
                          validator: (value) {
                            emailcontroller.text.length == 0
                                ? "Uh Oh! You forget to fill this"
                                : EmailValidator.validate(emailcontroller.text)
                                    ? null
                                    : "Please fill a valid email address";
                          },
                        ),
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
                          controller: Passwordcontroller,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          obscureText: true,
                          onFieldSubmitted: (value) {
                            setState(() {
                              Passwordcontroller.text = value;
                            });
                          },
                          validator: (value) {
                            value?.length == 0
                                ? "Uh Oh! You forget to fill this"
                                : null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      ElevatedButton(
                          onPressed: validateAndSave,
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
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: color1,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Forget Password?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 223, 90, 1),
                            fontSize:
                                MediaQuery.of(context).size.width * 0.038),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Center(
                        child: Text(
                          "New to $appname?",
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
                            Get.to(() => const SignupPage());
                          },
                          child: Text(
                            "Sign Up here",
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
                          "Login with your socials",
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
                              await googleController.googleLogIn();
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
                ),
              )
            ],
          ),
          isloading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
