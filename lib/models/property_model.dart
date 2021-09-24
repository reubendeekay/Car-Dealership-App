import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyModel {
  final String name;
  final String id;
  final List<dynamic> images;
  final String coverImage;
  final String description;
  final String price;
  final PropertyLocation location;
  final List<dynamic> ammenities;
  final String propertyOwner;
  final String ownerId;
  final List<dynamic> reviews;
  final List<Offer> offers;
  final String propertyCategory;

  const PropertyModel({
    this.name,
    this.id,
    this.coverImage,
    this.images,
    this.description,
    this.price,
    this.location,
    this.ammenities,
    this.propertyOwner,
    this.ownerId,
    this.reviews,
    this.offers,
    this.propertyCategory,
  });
}

class PropertyLocation {
  final double latitude;
  final double longitude;
  final String town;
  final String country;

  const PropertyLocation({
    this.latitude,
    this.longitude,
    this.country,
    this.town,
  });
}

class ReviewModel {
  final String nameOfReviewer;
  final double rating;
  final String review;
  final Timestamp dateReviewed;
  final String profilePic;

  ReviewModel(
      {this.nameOfReviewer,
      this.rating,
      this.review,
      this.dateReviewed,
      this.profilePic});

  Map<String, dynamic> toJson() {
    return {
      'nameOfReviewer': nameOfReviewer,
      'rating': rating,
      'review': review,
      'dateReviewed': dateReviewed,
      'profilePic': profilePic
    };
  }
}

class Offer {
  final String offerTitle;
  final double discount;
  final double price;

  Offer({this.offerTitle, this.discount, this.price});
}
