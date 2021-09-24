import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/screens/chat/add_message.dart';
import 'package:vehicle_management/screens/chat/widgets/chat_bubble.dart';
import 'package:vehicle_management/screens/chat/widgets/chat_tile.dart';

class ChatRoom extends StatelessWidget {
  static const routeName = '/chat-room';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                child: Text(
                  'Zanzibar Hotel',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.videocam_rounded,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          moreVert()
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                ChatBubble(true),
                ChatBubble(false),
                ChatBubble(false),
                ChatBubble(true),
                ChatBubble(false),
                ChatBubble(true),
                ChatBubble(true),
                ChatBubble(false),
                SizedBox(
                  height: 60,
                )
              ],
            ),
            Positioned(bottom: 5, child: AddMessage())
          ],
        ),
      ),
    );
  }

  Widget moreVert() {
    return PopupMenuButton(
        elevation: 1,
        itemBuilder: (xtx) => options
            .map((e) => PopupMenuItem(
                    child: Text(
                  e,
                  style: TextStyle(fontSize: 15),
                )))
            .toList(),
        icon: Icon(
          Icons.more_vert,
          color: Colors.grey,
        ));
  }

  List options = [
    'Search',
    'Mute notifications',
    'Clear chat',
    'Report',
    'Block'
  ];
}
