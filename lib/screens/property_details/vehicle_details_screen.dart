import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/models/vehicle_model.dart';
import 'package:vehicle_management/screens/booking/booking_screen.dart';
import 'package:vehicle_management/screens/property_details/widgets/details_description.dart';
import 'package:vehicle_management/screens/property_details/widgets/top_images.dart';
import 'package:page_transition/page_transition.dart';

class VehicleDetailsScreen extends StatefulWidget {
  static const routeName = '/property-details';

  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final vehicle = ModalRoute.of(context).settings.arguments as VehicleModel;

    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(clipBehavior: Clip.none, children: [
          SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  expandedHeight: size.height * 0.4,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text('',
                        style: TextStyle(fontSize: 15.0, shadows: [
                          Shadow(
                              color: Theme.of(context).primaryColor,
                              blurRadius: 5)
                        ])),
                    background:
                        TopImages([vehicle.coverImage, ...vehicle.images]),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, i) => DetailsBody(vehicle),
                        childCount: 1))
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                width: size.width,
                color: Theme.of(context).primaryColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ksh. ${vehicle.price}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kPrimary),
                      ),
                      Spacer(),
                      RaisedButton(
                        onPressed: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                duration: Duration(milliseconds: 200),
                                child: BookingScreen())),
                        color: kPrimary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12),
                            child: const Text(
                              'Booking Now',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ]),
              )),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: kPrimary,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: kPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class DetailsBody extends StatefulWidget {
  final VehicleModel vehicle;
  DetailsBody(this.vehicle);
  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        // height: size.height * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30),
            topRight: const Radius.circular(30),
          ),
        ),
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: kPrimary,
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${widget.vehicle.location}',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '${widget.vehicle.model}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Pending',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                'Super fast',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.circle,
                size: 6,
                color: kPrimary,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Modern',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.circle,
                size: 6,
                color: kPrimary,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Convertible',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1,
              height: 2,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.speed,
                          size: 30,
                          color:
                              selectedOption == 0 ? kPrimary : Colors.grey[300],
                        ),
                        Text(
                          'Max Speed',
                          style: TextStyle(
                              color: kPrimary, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '315 km/hr',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.drive_eta_outlined,
                          size: 30,
                          color: kPrimary,
                        ),
                        Text(
                          'Mileage',
                          style: TextStyle(
                              color: kPrimary, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '1000 km',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.bakery_dining_outlined,
                        size: 30,
                        color: kPrimary,
                      ),
                      Text(
                        'Horsepower',
                        style: TextStyle(
                            color: kPrimary, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '1000 cc',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.local_gas_station_outlined,
                        size: 30,
                        color: kPrimary,
                      ),
                      Text(
                        'Fuel Type',
                        style: TextStyle(
                            color: kPrimary, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Diesel',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    detail('Type', 'Used Car'),
                    detail('Make', 'Toyota'),
                    detail('Model', 'G-black 2014'),
                    detail('Variant', '00XL'),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    detail('Capacity', '1920 cc'),
                    detail('Transmission', 'Automatic'),
                    detail('Seat Capacity', '5'),
                    detail('Mileage', '108000'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            DetailsDescription(widget.vehicle),
            SizedBox(
              height: 40,
            )
          ]),
        ));
  }

  Widget detail(String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: 180,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 90,
              alignment: Alignment.centerLeft,
              child: Text(
                '$title:',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              // width: 80,
              alignment: Alignment.centerLeft,

              child: Text(
                value,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
