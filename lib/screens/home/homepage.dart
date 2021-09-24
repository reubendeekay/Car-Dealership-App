import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/providers/property_provider.dart';

import 'package:vehicle_management/screens/home/widgets/avatar.dart';
import 'package:vehicle_management/screens/home/widgets/home_title.dart';

import 'package:vehicle_management/screens/home/widgets/top_location.dart';
import 'package:vehicle_management/screens/home/widgets/top_search.dart';
import 'package:vehicle_management/screens/notifications/notifications_screen.dart';
import 'package:vehicle_management/widgets/property/properties.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<PropertyProvider>(context).fetchProperties();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(children: [
          //Top Location and Avatar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(children: [
              UserAvatar(),
              const SizedBox(
                width: 10,
              ),
              TopLocation(),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(NotificationsScreen.routeName),
                child: const Icon(
                  Icons.notifications_active_outlined,
                  color: kPrimary,
                ),
              )
            ]),
          ),
          //Search Bar
          TopSearch(),
          //RECOMMENDED PROPERTIES
          HomeTitle('Featured'),
          Container(
              margin: EdgeInsets.only(left: 15),
              height: 230,
              child: FeaturedProperty()),

          const SizedBox(
            height: 10,
          ),
          //TOP RATED PROPERTIES
          HomeTitle('Recommended for you'),
          Column(
            children: [
              const SizedBox(
                width: 15,
              ),
              AllProperty()
            ],
          ),
        ]),
      ),
    );
  }
}
