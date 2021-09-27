import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';

class MapSearchScreen extends StatefulWidget {
  static const routeName = '/map-search';
  @override
  _MapSearchScreenState createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              size: 25,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                TopWidget(),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        color: Colors.grey[300],
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7.5),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Unnamed Road',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: 45,
                        color: Colors.grey[300],
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Search destination',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
      ),
      child: Column(
        children: [
          circle(color: kPrimary),
          Container(
            width: 3,
            height: 40,
            color: Colors.grey[300],
          ),
          circle(color: Colors.green),
        ],
      ),
    );
  }

  Widget circle({Color color}) {
    return Container(
      width: 20,
      height: 20,
      child: Stack(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
