import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:furniture_app/Custom_presets/Main_naming.dart';
import 'package:furniture_app/Pages/Myfavorite/favoriteProducts.dart';
import 'package:furniture_app/Pages/error.dart';
import 'package:furniture_app/Pages/people.dart';
import 'package:furniture_app/drawer_item.dart';
import 'package:get/get.dart';

import 'Pages/check_User_Data.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  static final User _user = FirebaseAuth.instance.currentUser!;

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40, 24, 0),
          child: Column(
            children: [
              headerWidget(context),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 40,
              ),
              DrawerItem(
                name: 'People',
                icon: Icons.people,
                onPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'My Account',
                  icon: Icons.account_box_rounded,
                  onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Chats',
                  icon: Icons.message_outlined,
                  onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Favourites',
                  icon: Icons.favorite_outline,
                  onPressed: () {
                    Get.to(() => const FavoriteProductPage());
                  }),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Setting',
                  icon: Icons.settings,
                  onPressed: () {
                    Get.to(() => const ErrorPage());
                  }),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.to(() => const CheckUserData());
                  }),
              const Spacer(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "©Copyright by",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                      ),
                      Image.asset(
                        logoLocation,
                        scale: MediaQuery.of(context).size.width * 0.01,
                      )
                    ],
                  ),
                  Text(
                    "All right reserved.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.02),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const People()));
        break;
    }
  }

  Widget headerWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NavigationDrawer._user.photoURL == null
              ? const AssetImage("assets/images/Profile Image.png")
              : CachedNetworkImageProvider(NavigationDrawer._user.photoURL!)
                  as ImageProvider,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.37,
              height: MediaQuery.of(context).size.height * 0.03,
              child: FittedBox(
                child: Text(NavigationDrawer._user.displayName ?? "Person",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.025,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.37,
              height: MediaQuery.of(context).size.height * 0.02,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(NavigationDrawer._user.email ?? "Email.id",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.025,
                        color: Colors.orange)),
              ),
            )
          ],
        )
      ],
    );
  }
}
