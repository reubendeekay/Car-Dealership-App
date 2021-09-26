import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/models/property_model.dart';
import 'package:vehicle_management/models/vehicle_model.dart';
import 'package:vehicle_management/screens/property_details/property_details_screen.dart';
import 'package:vehicle_management/widgets/cached_image.dart';
import 'package:vehicle_management/widgets/rating_bar.dart';

class VehicleSmall extends StatelessWidget {
  final VehicleModel vehicle;
  VehicleSmall(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 240,
      margin: const EdgeInsets.only(right: 10, bottom: 5),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(PropertyDetailsScreen.routeName, arguments: vehicle),
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Theme.of(context).shadowColor,
                      spreadRadius: 1)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 150,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: cachedImage(
                            vehicle.coverImage,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 15,
                          child: Ratings(),
                        ),
                        Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(
                                5,
                              ),
                              decoration: BoxDecoration(
                                  color: vehicle.color,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                vehicle.status,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ))
                      ],
                    )),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle.model,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: kPrimary,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '${vehicle.location}',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Ksh. ${vehicle.price}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: kPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
