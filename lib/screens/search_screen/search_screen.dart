import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:vehicle_management/screens/home/filters.dart';
import 'package:vehicle_management/screens/home/widgets/property_card.dart';
import 'package:vehicle_management/screens/search_screen/widgets/recent_searches.dart';
import 'package:vehicle_management/widgets/property/properties.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        controller: _controller,
        backgroundColor: Colors.grey[50],
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
        child: Snap(
          controller: _controller.appBar,
          child: ListView(
            controller: _controller,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Hero(
                  tag: 'search-bar',
                  transitionOnUserGestures: true,
                  child: Card(
                    // color: Color(0xFF6939DB),
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),

                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 22,
                            color: Colors.grey[500],
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: const Radius.circular(20),
                                      topRight: const Radius.circular(20)),
                                ),
                                context: context,
                                builder: (ctx) => Filters()),
                            icon: Icon(
                              FontAwesomeIcons.slidersH,
                              size: 18,
                              color: Colors.grey[500],
                            ),
                          ),
                          hintText: 'Search name or location',
                          hintStyle:
                              TextStyle(color: Colors.grey[500], fontSize: 18)),
                    ),
                  ),
                ),
              ),
              RecentSearches(),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text(
                  'Featured Properties',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  AllProperty()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
