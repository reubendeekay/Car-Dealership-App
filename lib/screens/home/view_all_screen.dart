import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:vehicle_management/models/property_model.dart';
import 'package:vehicle_management/screens/property_details/property_details_screen.dart';
import 'package:vehicle_management/screens/search_screen/search_screen.dart';
import 'package:vehicle_management/widgets/cached_image.dart';
import 'package:vehicle_management/widgets/property/properties.dart';

class ViewAllScreen extends StatelessWidget {
  static const routeName = '/view-all';
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ScrollAppBar(
          controller: controller,
          automaticallyImplyLeading: false,
          title: Hero(
            tag: 'search-bar',
            transitionOnUserGestures: true,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  // color: Color(0xFF6939DB),
                  borderRadius: BorderRadius.circular(20)),
              child: GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SearchScreen.routeName),
                child: Card(
                  // color: Color(0xFF6939DB),
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Text('Search by name or location',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 18)),
                        Spacer(),
                        const Icon(
                          Icons.search,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: Snap(
              controller: controller.appBar, child: ViewAllWidgets(controller)),
        ));
  }
}

class ViewAllCard extends StatelessWidget {
  final PropertyModel property;
  ViewAllCard(this.property);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(PropertyDetailsScreen.routeName, arguments: property),
      child: Container(
        child: cachedImage(
          property.coverImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
