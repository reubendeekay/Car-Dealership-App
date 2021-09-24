import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';

class ChatBubble extends StatelessWidget {
  final bool isMe;
  ChatBubble(this.isMe);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          constraints: BoxConstraints(maxWidth: size.width * 0.8),
          decoration: BoxDecoration(
              color: isMe ? Colors.grey : kPrimary,
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 40, 10),
                child: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text('23:05 ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
