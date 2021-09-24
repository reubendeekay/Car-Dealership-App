import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:vehicle_management/models/property_model.dart';

class PropertyProvider with ChangeNotifier {
  List<PropertyModel> _properties = [];
  List<PropertyModel> get properties => [..._properties];

  Future<void> fetchProperties() async {
    final propertyData = await FirebaseFirestore.instance
        .collection('propertyData')
        .doc('propertyListing')
        .collection('properties')
        .get();
    List<PropertyModel> propData = [];

    propertyData.docs.forEach((e) {
      propData.add(PropertyModel(
        id: e.id,
        name: e['name'],
        coverImage: e['coverImage'],
        ammenities: e['ammenities'],
        price: e['price'],
        location: PropertyLocation(
          country: e['location']['country'],
          latitude: e['location']['latitude'],
          longitude: e['location']['longitude'],
          town: e['location']['town'],
        ),
        images: e['images'],
        reviews: e['reviews'],
        ownerId: e['ownerId'],
        propertyOwner: e['ownerName'],
        propertyCategory: e['propertyCategory'],
        description: e['description'],
        offers: e['offers'],
      ));
    });

    _properties = propData;

    notifyListeners();
  }

  Future<void> addReview(ReviewModel review, String id) async {
    await FirebaseFirestore.instance
        .collection('propertyData')
        .doc('propertyListing')
        .collection('properties')
        .doc(id)
        .update({
      'reviews': FieldValue.arrayUnion([review.toJson()])
    });
    print(review.toJson());

    notifyListeners();
  }
}
