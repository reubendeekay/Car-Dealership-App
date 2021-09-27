import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final String tag;

  const NotificationTile({Key key, this.title, this.description, this.tag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        tag,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: kPrimary),
                      ),
                      Text(
                        ' $title',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
