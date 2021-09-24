import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/screens/home/filters.dart';
import 'package:vehicle_management/screens/search_screen/search_screen.dart';

class TopSearch extends StatefulWidget {
  @override
  _TopSearchState createState() => _TopSearchState();
}

class _TopSearchState extends State<TopSearch> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'search-bar',
              transitionOnUserGestures: true,
              child: Container(
                height: 52,
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
                          const Icon(
                            Icons.search,
                            size: 22,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Search by name or location',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18)),
                          Spacer(),
                          const Icon(
                            FontAwesomeIcons.slidersH,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    categories.length,
                    (i) => GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected = i;
                            });
                          },
                          child: category(categories[i]['category'],
                              isSelected == i, categories[i]['icon']),
                        )),
              ),
            )
          ],
        ));
  }

  final List categories = [
    {
      'category': 'Apartments',
      'isSelected': false,
      'icon': FontAwesomeIcons.archway
    },
    {'category': 'Cottage', 'isSelected': false, 'icon': FontAwesomeIcons.home},
    {
      'category': 'Hotel',
      'isSelected': false,
      'icon': FontAwesomeIcons.campground
    },
    {
      'category': 'Bungalow',
      'isSelected': false,
      'icon': FontAwesomeIcons.university
    },
    {
      'category': 'Resort',
      'isSelected': false,
      'icon': FontAwesomeIcons.building
    },
  ];

  Widget category(String category, bool isSelected, IconData icon) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 19),
      decoration: BoxDecoration(
          border: isSelected ? null : Border.all(width: 1, color: Colors.grey),
          color: isSelected ? kPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey,
            size: 14,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(category,
              style: TextStyle(color: isSelected ? Colors.white : Colors.grey)),
        ],
      ),
    );
  }
}
