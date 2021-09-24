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

          title: Text('Notifications', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.grey[50],
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
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Snap(
          controller: _scrollController.appBar,
          child: SafeArea(
            child: ListView(
              controller: _scrollController,
              children: [
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
                NotificationTile(),
              ],
            ),
          ),
        ));
  }
}
