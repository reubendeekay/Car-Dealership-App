import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/models/vehicle_model.dart';

import 'package:vehicle_management/screens/home/widgets/avatar.dart';
import 'package:vehicle_management/screens/home/widgets/home_title.dart';

import 'package:vehicle_management/screens/home/widgets/top_location.dart';
import 'package:vehicle_management/screens/home/widgets/top_search.dart';
import 'package:vehicle_management/screens/notifications/notifications_screen.dart';
import 'package:vehicle_management/screens/vehicles/vehicle_card.dart';
import 'package:vehicle_management/screens/vehicles/vehicle_small.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          HomeTitle('Latest Cars'),
          Container(
              margin: EdgeInsets.only(left: 15),
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  VehicleSmall(
                    VehicleModel(
                        coverImage:
                            'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-audi-rs7-112-1569274021.jpg?crop=0.735xw:0.673xh;0.141xw,0.270xh&resize=480:*',
                        model: 'BMW X6 2021',
                        location: 'Yard 1',
                        images: [
                          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-audi-rs7-112-1569274021.jpg?crop=0.735xw:0.673xh;0.141xw,0.270xh&resize=480:*'
                        ],
                        price: '4,000,000',
                        color: Colors.red,
                        status: 'Pending'),
                  ),
                  VehicleSmall(VehicleModel(
                      coverImage:
                          'https://www.cheki.co.ke/blog/wp-content/uploads/sites/15/2021/08/audi.jpg',
                      model: '2012 Audi A4',
                      images: [
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-audi-rs7-112-1569274021.jpg?crop=0.735xw:0.673xh;0.141xw,0.270xh&resize=480:*'
                      ],
                      location: 'Yard 2',
                      price: '2,450,000',
                      color: Colors.green,
                      status: 'Transit')),
                ],
              )),

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
              VehicleCard(
                VehicleModel(
                    coverImage:
                        'https://cdn.globalcarsbrands.com/wp-content/uploads/2017/11/fastback-sedan-type.jpg',
                    model: 'Toyota Fastback Sedan',
                    location: 'Yard 3',
                    price: '1,450,000',
                    color: Colors.red,
                    status: 'Pending'),
              ),
              VehicleCard(
                VehicleModel(
                    coverImage:
                        'https://cdn.arstechnica.net/wp-content/uploads/2018/10/x4-1-760x380.jpg',
                    model: 'BMW X4 ',
                    location: 'Yard 1',
                    price: '3,200,000',
                    color: Colors.green,
                    status: 'Transit'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
