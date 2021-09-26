import 'package:flutter/material.dart';
import 'package:vehicle_management/screens/property_details/widgets/details_fullscreen.dart';
import 'package:vehicle_management/widgets/cached_image.dart';

class DetailsPhotos extends StatelessWidget {
  List<String> images;
  DetailsPhotos(this.images);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            'More Photos',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    images.length, (index) => photos(images[index], context))),
          )
        ],
      ),
    );
  }

  Widget photos(String asset, BuildContext context) {
    return Container(
      height: 150,
      width: 120,
      margin: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(DetailsFullScreen.routeName, arguments: asset),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Hero(
            tag: asset,
            transitionOnUserGestures: true,
            child: cachedImage(
              asset,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
