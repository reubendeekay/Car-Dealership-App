import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:vehicle_management/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/loading_screen.dart';
import 'package:vehicle_management/models/user_model.dart';
import 'package:vehicle_management/providers/auth_provider.dart';
import 'package:vehicle_management/providers/location_provider.dart';
import 'package:vehicle_management/screens/history/history_screen.dart';
import 'package:vehicle_management/screens/profile/user_profile.dart';
import 'package:vehicle_management/screens/wishlist/wishlist_screen.dart';

class MainDrawer extends StatefulWidget {
  static const String routeName = '/main_drawer';

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final _controller = ZoomDrawerController();

  int currentIndex = 0;

  List<String> options = [
    'Home',
    'Edit Profile',
    'History',
    'Wishlist',
    'Payment methods',
  ];

  List<Widget> screens = [
    MyNav(),
    UserProfile(
      isFromDrawer: true,
    ),
    HistoryScreen(
      isDrawer: true,
    ),
    WishlistScreen(),
    MyNav(),
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<LocationProvider>(context).getCurrentLocation();
    final isRtl = false;
    return ZoomDrawer(
      controller: _controller,
      menuScreen: buildProfile(context),
      mainScreen: Provider.of<AuthProvider>(context).user == null
          ? LoadingScreen()
          : screens[currentIndex],
      borderRadius: 24.0,
      closeCurve: Curves.easeInToLinear,
      showShadow: true,
      duration: Duration(milliseconds: 200),
      style: DrawerStyle.Style1,
      angle: -10.0,
      backgroundColor: Colors.amber,
      isRtl: isRtl,
      slideWidth: MediaQuery.of(context).size.width * (isRtl ? .45 : 0.65),
    );
  }

  Widget buildProfile(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<AuthProvider>(
                  builder: (ctx, data, _) {
                    data.getCurrentUser(FirebaseAuth.instance.currentUser.uid);

                    UserModel user = data.user;
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: user.imageUrl != null
                              ? NetworkImage(user.imageUrl)
                              : AssetImage('assets/images/avatar.png'),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            user != null ? user.fullName : 'Hello there!',
                            style: GoogleFonts.barlowSemiCondensed(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        )
                      ],
                    );
                  },
                )),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  options.length,
                  (index) => menuOption(
                      context, options[index], currentIndex == index, index),
                )),
            Spacer(),

            ////////////////////////////////SIGN OUT//////////////////////////////////////
            GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                )),
            SizedBox(
              height: 30,
            )
            //////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }

  Widget menuOption(
      BuildContext context, String title, bool isSelected, int index) {
    return Container(
      child: TextButton(
        onPressed: () {
          setState(() {
            currentIndex = index;
          });
          _controller.close();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.amber : Colors.white,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
