import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/custom_shapes/customappbar.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  static final User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
      children: [
        const CustomAppbar(),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.05),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.03),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.115,
                        backgroundImage: user.photoURL == null
                            ? const AssetImage(
                                "assets/images/Profile Image.png")
                            : CachedNetworkImageProvider(user.photoURL!)
                                as ImageProvider,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.37,
                        height: MediaQuery.of(context).size.height * 0.03,
                        child: FittedBox(
                          child: Text(user.displayName ?? "Person",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.025,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  TitlesTile(heading: "Email", data: user.email.toString()),
                  GestureDetector(
                      onTap: () async {
                        await getuserdata();
                      },
                      child: Text(user.providerData.toString())),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }

  getuserdata() async {
    final snapshot = user.providerData == "password"
        ? await FirebaseDatabase.instance
            .ref()
            .child("Users")
            .child("Email Sign in")
            .child(removeSpecialCharacters(user.email!))
            .get()
        : await FirebaseDatabase.instance
            .ref()
            .child("Users")
            .child("Google Sign in")
            .child(removeSpecialCharacters(user.email!))
            .get();
    print(snapshot);
  }
}

String removeSpecialCharacters(String text) {
  return text.replaceAll("@", "").replaceAll(".", "");
}

class TitlesTile extends StatelessWidget {
  final String heading;
  final String data;

  const TitlesTile({super.key, required this.heading, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$heading : ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.04),
        ),
        Text(
          data,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
        )
      ],
    );
  }
}
