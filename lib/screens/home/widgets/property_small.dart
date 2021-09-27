import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/models/property_model.dart';
import 'package:vehicle_management/screens/property_details/vehicle_details_screen.dart';
import 'package:vehicle_management/widgets/cached_image.dart';
import 'package:vehicle_management/widgets/rating_bar.dart';

class PropertySmall extends StatelessWidget {
  final PropertyModel property;
  PropertySmall(this.property);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 240,
      margin: const EdgeInsets.only(right: 10, bottom: 5),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(VehicleDetailsScreen.routeName, arguments: property),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1, color: Colors.grey[100], spreadRadius: 1)
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
                            property.coverImage,
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
                                8,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.black26.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.bookmark_border,
                                color: Colors.grey[200],
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
                          property.name,
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
                              '${property.location.town}, ${property.location.country}',
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
                          'Ksh. ${property.price}',
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
