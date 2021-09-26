import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/loading_screen.dart';
import 'package:vehicle_management/providers/auth_provider.dart';
import 'package:vehicle_management/screens/dashboard/add_vehicle/dashboard.dart';
import 'package:vehicle_management/screens/home/homepage.dart';
import 'package:vehicle_management/screens/map_overview/map_overview_screen.dart';
import 'package:vehicle_management/screens/settings/settings_screen.dart';
import 'package:vehicle_management/screens/transactions/transaction_screen.dart';

class MyNav extends StatefulWidget {
  static const routeName = '/my-nav';
  @override
  _MyNavState createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> {
  var _selectedTab = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(
      context,
    ).getCurrentUser(FirebaseAuth.instance.currentUser.uid);
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    List _screens = [
      if (user.isAdmin) Dashboard(),
      Homepage(),
      MapOverviewScreen(),
      TransactionScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_selectedTab != 0) {
            setState(() {
              _selectedTab = 0;
            });
          } else {
            Navigator.of(context).pop();
          }

          return false;
        },
        child: user == null ? LoadingScreen() : _screens[_selectedTab],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: DotNavigationBar(
          marginR: const EdgeInsets.all(10),
          paddingR: const EdgeInsets.all(3),
          backgroundColor: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 1,
            )
          ],
          margin: const EdgeInsets.only(left: 5, right: 5),
          selectedItemColor: kPrimary,
          currentIndex: _selectedTab,
          dotIndicatorColor: Theme.of(context).backgroundColor,
          unselectedItemColor: Colors.grey[300],
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            if (user.isAdmin)
              DotNavigationBarItem(
                icon: const Icon(
                  Icons.grid_view,
                  size: 26,
                ),
              ),

            /// Home
            DotNavigationBarItem(
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
            ),

            /// Likes

            DotNavigationBarItem(
              icon: const Icon(
                Icons.location_on,
                size: 30,
              ),
            ),

            /// Search
            DotNavigationBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.solidComment,
                size: 26,
              ),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: const FaIcon(
                Icons.settings,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyNav extends StatefulWidget {
//   static const routeName = '/my-nav';

//   @override
//   _MyNavState createState() => _MyNavState();
// }

// class _MyNavState extends State<MyNav> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

//   @override
//   Widget build(BuildContext context) {
//     Provider.of<AuthProvider>(context)
//         .getCurrentUser(FirebaseAuth.instance.currentUser.uid);
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 20,
//               color: Colors.black.withOpacity(.1),
//             )
//           ],
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
//             child: GNav(
//               rippleColor: Colors.grey[300],
//               hoverColor: Colors.grey[100],
//               gap: 8,
//               activeColor: kPrimary,
//               // iconSize: 24,
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               duration: Duration(milliseconds: 400),
//               tabBackgroundColor: Colors.grey[100],
//               color: Colors.grey,
//               tabs: [
//                 GButton(
//                   icon: Icons.home_outlined,
//                   text: 'Home',
//                   // iconSize: 26,
//                 ),
//                 GButton(
//                   icon: Icons.location_on_outlined,
//                   text: 'Map',
//                 ),
//                 GButton(
//                   icon: Icons.attach_money_outlined,
//                   text: 'Transcations',
//                 ),
//                 GButton(
//                   icon: Icons.settings_outlined,
//                   text: 'Settings',
//                 ),
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


