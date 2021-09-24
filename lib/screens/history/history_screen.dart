import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/widgets/property/properties.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = '/history';
  final bool isDrawer;
  HistoryScreen({this.isDrawer = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isDrawer
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                  onTap: () => ZoomDrawer.of(context).open(),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  )))
          : null,
      body: SafeArea(
        child: ListView(
          children: [
            if (!isDrawer) SizedBox(height: 20),
            if (!isDrawer)
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(Icons.arrow_back_ios_new))),
                ],
              ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Your History',
                style: GoogleFonts.barlow(
                    fontSize: 24, fontWeight: FontWeight.bold, color: kPrimary),
              ),
            ),
            SizedBox(height: 30),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'See the latest properties you viewed in case you want to return',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(),
            ),
            AllProperty()
          ],
        ),
      ),
    );
  }
}
