import 'package:flutter/material.dart';

class AddMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[200]),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.camera_alt_rounded),
                    hintText: 'Message'),
              ),
            ),
          ),
          CircleAvatar(
            radius: 23,
            child: IconButton(
              splashRadius: 25,
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}
