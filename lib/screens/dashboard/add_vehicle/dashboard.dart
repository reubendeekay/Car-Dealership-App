import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/providers/auth_provider.dart';
import 'package:vehicle_management/providers/location_provider.dart';
import 'package:vehicle_management/screens/dashboard/add_vehicle/add_vehicle.dart';
import 'package:vehicle_management/screens/dashboard/add_yard/add_yard_screen.dart';
import 'package:vehicle_management/screens/dashboard/widgets/home_action_tile.dart';
import 'package:vehicle_management/screens/dashboard/widgets/home_top.dart';
import 'package:vehicle_management/screens/management/manage_staff.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Provider.of<LocationProvider>(context).getCurrentLocation();
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DashboardTop(),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 2.1,
                children: [
                  HomeActionTile(
                    isActive: true,
                    number: 1,
                    routeName: AddVehicle.routeName,
                    title: 'Transcations',
                  ),
                  HomeActionTile(
                    isActive: false,
                    number: 2,
                    routeName: AddVehicle.routeName,
                    title: 'Add Vehicle',
                  ),
                  HomeActionTile(
                    isActive: false,
                    number: 3,
                    routeName: AddVehicle.routeName,
                    title: 'Manage Vehicles',
                  ),
                  HomeActionTile(
                    isActive: false,
                    number: 4,
                    routeName: ManageStaff.routeName,
                    title: 'Manage Staff',
                  ),
                  HomeActionTile(
                    isActive: false,
                    number: 5,
                    routeName: AddYardScreen.routeName,
                    title: 'Manage Yards',
                  ),
                  HomeActionTile(
                    isActive: false,
                    number: 6,
                    routeName: AddVehicle.routeName,
                    title: 'Send Notification',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
