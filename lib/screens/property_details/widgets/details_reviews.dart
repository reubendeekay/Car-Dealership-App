import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/models/property_model.dart';
import 'package:vehicle_management/providers/auth_provider.dart';
import 'package:vehicle_management/providers/property_provider.dart';
import 'package:vehicle_management/widgets/property/properties.dart';
import 'package:vehicle_management/widgets/rating_bar.dart';

class PropertyReviews extends StatelessWidget {
  final PropertyModel property;
  PropertyReviews({@required this.property});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 30,
                child: TextButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          children: [UserReview(property.id)])),
                  child: Row(children: [
                    const Text(
                      'Give a Review',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: kPrimary,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.comment,
                      color: kPrimary,
                      size: 16,
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Text(
            'Customer Reviews\t(${property.reviews != null ? property.reviews.length : 0})',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Reviews(
            property.id,
          ),
        ],
      ),
    );
  }
}

class UserReview extends StatefulWidget {
  final String propertyId;
  UserReview(this.propertyId);
  @override
  _UserReviewState createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  double _rating;
  final reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    return Container(
      width: size.width,
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Leave a Rating',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              buildReview(),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                    maxLines: null,
                    controller: reviewController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      labelText: 'Write a review',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          )),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              RaisedButton(
                color: kPrimary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () async {
                  if (reviewController.text.isNotEmpty &&
                      _rating != null &&
                      _rating > 0.5) {
                    await Provider.of<PropertyProvider>(context, listen: false)
                        .addReview(
                            ReviewModel(
                              rating: _rating,
                              dateReviewed: Timestamp.now(),
                              nameOfReviewer: user.fullName,
                              profilePic: user.imageUrl,
                              review: reviewController.text,
                            ),
                            widget.propertyId);
                  }
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 13),
                  child: const Text(
                    'Submit',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget buildReview() {
    return Container(
      child: RatingBar(
        onRatingChanged: (rating) => setState(() => _rating = rating),
        filledIcon: Icons.star,
        emptyIcon: Icons.star_border,
        halfFilledIcon: Icons.star_half,
        isHalfAllowed: true,
        filledColor: kPrimary,
        emptyColor: Colors.amber,
        halfFilledColor: kPrimary,
        size: 25,
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final ReviewModel review;
  ReviewTile({this.review});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(review.profilePic)),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.nameOfReviewer,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Ratings(),
                    Spacer(),
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format(review.dateReviewed.toDate()),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  review.review,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.grey[400]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
