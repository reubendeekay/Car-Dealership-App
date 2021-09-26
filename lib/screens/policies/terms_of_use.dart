import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';

class TermsofUse extends StatelessWidget {
  static const routeName = '/terms-of-use';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms of Use',
          // style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        // backgroundColor: Colors.grey[50],
        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Text(
              kTermsandConditions,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
