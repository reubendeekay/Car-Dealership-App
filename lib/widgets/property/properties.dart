import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vehicle_management/loading_screen.dart';
import 'package:vehicle_management/models/property_model.dart';
import 'package:vehicle_management/screens/home/view_all_screen.dart';
import 'package:vehicle_management/screens/home/widgets/property_card.dart';
import 'package:vehicle_management/screens/home/widgets/property_small.dart';
import 'package:vehicle_management/screens/property_details/widgets/details_reviews.dart';

class AllProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('propertyData')
            .doc('propertyListing')
            .collection('properties')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError || snapshot.data == null) {
            return Container();
          } else {
            List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: documents
                  .map((e) => PropertyCard(PropertyModel(
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
                      )))
                  .toList(),
            );
          }
        });
  }
}

class FeaturedProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('propertyData')
            .doc('propertyListing')
            .collection('properties')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError || snapshot.data == null) {
            return Container();
          } else {
            List<DocumentSnapshot> documents = snapshot.data.docs;
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: documents
                  .map((e) => PropertySmall(PropertyModel(
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
                      )))
                  .toList(),
            );
          }
        });
  }
}

class ViewAllWidgets extends StatelessWidget {
  final ScrollController controller;
  ViewAllWidgets(this.controller);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('propertyData')
            .doc('propertyListing')
            .collection('properties')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError || snapshot.data == null) {
            return LoadingScreen();
          } else {
            List<DocumentSnapshot> documents = snapshot.data.docs;
            return StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              },
              controller: controller,
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              itemCount: documents.length,
              itemBuilder: (context, index) {
                return ViewAllCard(PropertyModel(
                  id: documents[index].id,
                  name: documents[index]['name'],
                  coverImage: documents[index]['coverImage'],
                  ammenities: documents[index]['ammenities'],
                  price: documents[index]['price'],
                  location: PropertyLocation(
                    country: documents[index]['location']['country'],
                    latitude: documents[index]['location']['latitude'],
                    longitude: documents[index]['location']['longitude'],
                    town: documents[index]['location']['town'],
                  ),
                  images: documents[index]['images'],
                  reviews: documents[index]['reviews'],
                  ownerId: documents[index]['ownerId'],
                  propertyOwner: documents[index]['ownerName'],
                  propertyCategory: documents[index]['propertyCategory'],
                  description: documents[index]['description'],
                  offers: documents[index]['offers'],
                ));
              },
            );
          }
        });
  }
}

class Reviews extends StatelessWidget {
  final String id;
  Reviews(this.id);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('propertyData')
            .doc('propertyListing')
            .collection('properties')
            .doc(id)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError || snapshot.data == null) {
            return Container(
                height: 150,
                child: Center(
                  child: Lottie.asset(
                    'assets/not_foundy.json',
                  ),
                ));
          } else {
            DocumentSnapshot document = snapshot.data;
            return document['reviews'] != null
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, i) => ReviewTile(
                        review: ReviewModel(
                      dateReviewed: document['reviews'][i]['dateReviewed'],
                      nameOfReviewer: document['reviews'][i]['nameOfReviewer'],
                      review: document['reviews'][i]['review'],
                      profilePic: document['reviews'][i]['profilePic'],
                      rating: document['reviews'][i]['rating'],
                    )),
                    itemCount: document['reviews'].length,
                  )
                : Container(
                    height: 150,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            child: Lottie.asset(
                              'assets/not_foundy.json',
                            ),
                          ),
                          Text('No reviews available...')
                        ],
                      ),
                    ));

            // );
            // children: document['reviews']
            //     .map((e) => ReviewTile(
            //             review: ReviewModel(
            //           dateReviewed: e['dateReviewed'],
            //           nameOfReviewer: e['nameOfReviewer'],
            //           review: e['review'],
            //           profilePic: e['profilePic'],
            //           rating: e['rating'],
            //         )))
            //     .toList());
          }
        });
  }
}
