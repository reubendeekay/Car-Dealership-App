import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/screens/chat/widgets/chat_tile.dart';

class ChatScreen extends StatelessWidget {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ScrollAppBar(
        controller: _controller,
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          height: 70,
          alignment: Alignment.bottomLeft,
          child: Text(
            'Chat',
            style: GoogleFonts.barlow(
                fontSize: 34, fontWeight: FontWeight.w900, color: kPrimary),
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 10,
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Snap(
          controller: _controller.appBar,
          child: ListView(
            controller: _controller,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    'Consult respective residence officials. Get to know where you will stay and avail any special request. ',
                    style: TextStyle(color: Colors.grey)),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
              ChatTile(),
            ],
          ),
        ),
      ),
    );
  }
}
