import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/widgets/property/properties.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: ScrollAppBar(
            controller: _controller,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: GestureDetector(
                onTap: () => ZoomDrawer.of(context).open(),
                child: Icon(Icons.format_align_left_outlined,
                    color: Colors.black))),
        body: Snap(
          controller: _controller.appBar,
          child: ListView(
            controller: _controller,
            children: [
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Wishlist',
                  style: GoogleFonts.barlow(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: kPrimary),
                ),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                    'Properties you have added to the wishlist will appear here',
                    style: TextStyle(color: Colors.grey)),
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AllProperty()
            ],
          ),
        ));
  }
}
