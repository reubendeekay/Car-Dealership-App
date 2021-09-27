import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/models/property_model.dart';
import 'package:vehicle_management/models/vehicle_model.dart';
import 'package:vehicle_management/screens/property_details/vehicle_details_screen.dart';
import 'package:vehicle_management/widgets/cached_image.dart';
import 'package:vehicle_management/widgets/rating_bar.dart';

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicle;
  VehicleCard(this.vehicle);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
      child: GestureDetector(
        // onTap: () => Navigator.of(context)
        //     .pushNamed(PropertyDetailsScreen.routeName, arguments: vehicle),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    color: Theme.of(context).shadowColor,
                    spreadRadius: 1)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      width: size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: cachedImage(
                          vehicle.coverImage,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(
                          8,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Pending',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Ratings(),
                              Text(
                                vehicle.model,
                                style: TextStyle(
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 2,
                                        color: Colors.grey,
                                      )
                                    ],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: size.width,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: kPrimary,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${vehicle.location}',
                                      style: TextStyle(
                                          shadows: [
                                            BoxShadow(
                                                blurRadius: 1,
                                                color: Colors.grey[100],
                                                spreadRadius: 1),
                                          ],
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Ksh. ${vehicle.price}',
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                              blurRadius: 2,
                                              color: Colors.grey,
                                            )
                                          ],
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 55,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
