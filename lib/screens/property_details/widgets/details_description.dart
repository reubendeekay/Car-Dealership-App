import 'package:flutter/material.dart';
import 'package:vehicle_management/models/property_model.dart';
import 'package:vehicle_management/models/vehicle_model.dart';
import 'package:vehicle_management/screens/property_details/widgets/details_photos.dart';
import 'package:vehicle_management/screens/property_details/widgets/other_amenities.dart';
import 'package:vehicle_management/screens/property_details/widgets/property_details_location.dart';

class DetailsDescription extends StatelessWidget {
  final VehicleModel vehicle;
  DetailsDescription(this.vehicle);
  @override
  Widget build(BuildContext context) {
    List<String> images = [...vehicle.images];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Description',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          // vehicle.description,
          '''The 2021 BMW X6 has a comfortable interior, composed handling, strong engine performance, and a great predicted reliability score but not much cargo room for a luxury midsize SUV. The X6 does not have an overall score or ranking because it has not been fully crash tested.The 2021 BMW X6 is unranked in Luxury Midsize SUVs due to missing safety data. Currently, the BMW X6's overall score is not available, though its Critics' Rating, Performance score, and Interior score are based on our evaluation of 9 pieces of research and data.''',
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 16),
        ),
        DetailsPhotos(images),
        // PropertyDetailsLocation(vehicle),
        // OtherAmenities(vehicle),
      ]),
    );
  }
}
