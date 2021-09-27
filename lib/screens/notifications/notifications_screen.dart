import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:vehicle_management/screens/notifications/notification_settings.dart';
import 'package:vehicle_management/screens/notifications/widgets/notifications_tile.dart';

class NotificationsScreen extends StatelessWidget {
  static const routeName = '/notifications';
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ScrollAppBar(
          controller: _scrollController,

          title: Text(
            'Notifications',
          ),
          // backgroundColor: Colors.grey[50],
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NotificationSettings.routeName);
              },
              icon: FaIcon(
                FontAwesomeIcons.slidersH,
                color: Colors.grey,
                size: 18,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
          // automaticallyImplyLeading: false,
          // iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Snap(
          controller: _scrollController.appBar,
          child: SafeArea(
            child: ListView(
              controller: _scrollController,
              children: [
                NotificationTile(
                  title: 'New Vehicle has been added',
                  tag: 'LATEST',
                  description:
                      'Toyota Axio Hybrid 2014 has been added to the collection. It is currently in Mombasa awaiting delivery to Yard 1 in Nairobi. The tracking number is XHGRT',
                ),
                NotificationTile(
                    tag: 'TRANSACTION',
                    title: 'BMW X6 2014 Edition sold',
                    description:
                        'Vehicle has been sold to Mr Kamau Njenga at Yard 1 for KES 4,300,000 at a 10% profit'),
                NotificationTile(
                    tag: 'TRANSIT',
                    title: 'Shipment X562 has left Mombasa',
                    description:
                        '10 Vehicles on Shipment X562 have left Mombasa on 27/09/2021 12:34 PM and is expected to reach Yard 2 Nairobi on 29/09/2021. The driver is Musa Korir.Track them real time.'),
                NotificationTile(
                  title: 'New Vehicle has been added',
                  tag: 'LATEST',
                  description:
                      'Toyota Axio Hybrid 2014 has been added to the collection. It is currently in Mombasa awaiting delivery to Yard 1 in Nairobi. The tracking number is XHGRT',
                ),
                NotificationTile(
                    tag: 'TRANSACTION',
                    title: 'BMW X6 2014 Edition sold',
                    description:
                        'Vehicle has been sold to Mr Kamau Njenga at Yard 1 for KES 4,300,000 at a 10% profit'),
                NotificationTile(
                    tag: 'TRANSIT',
                    title: 'Shipment X562 has left Mombasa',
                    description:
                        '10 Vehicles on Shipment X562 have left Mombasa on 27/09/2021 12:34 PM and is expected to reach Yard 2 Nairobi on 29/09/2021. The driver is Musa Korir.Track them real time.'),
                NotificationTile(
                  title: 'New Vehicle has been added',
                  tag: 'LATEST',
                  description:
                      'Toyota Axio Hybrid 2014 has been added to the collection. It is currently in Mombasa awaiting delivery to Yard 1 in Nairobi. The tracking number is XHGRT',
                ),
                NotificationTile(
                    tag: 'TRANSACTION',
                    title: 'BMW X6 2014 Edition sold',
                    description:
                        'Vehicle has been sold to Mr Kamau Njenga at Yard 1 for KES 4,300,000 at a 10% profit'),
                NotificationTile(
                    tag: 'TRANSIT',
                    title: 'Shipment X562 has left Mombasa',
                    description:
                        '10 Vehicles on Shipment X562 have left Mombasa on 27/09/2021 12:34 PM and is expected to reach Yard 2 Nairobi on 29/09/2021. The driver is Musa Korir.Track them real time.'),
              ],
            ),
          ),
        ));
  }
}
