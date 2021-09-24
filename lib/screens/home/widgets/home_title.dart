import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/screens/home/view_all_screen.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  HomeTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      child: Row(
        children: [
          Text(
            title,
            style: kText.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          TextButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(ViewAllScreen.routeName),
            child: Text(
              'View all',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
