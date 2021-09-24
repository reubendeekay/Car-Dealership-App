import 'package:flutter/material.dart';
import 'package:vehicle_management/screens/chat/chat_room.dart';

class ChatTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ChatRoom.routeName),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Zanzibar Hotel',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      '23:05',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    )
                  ],
                ),
                Text(
                  'Hello we have received your special request',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
