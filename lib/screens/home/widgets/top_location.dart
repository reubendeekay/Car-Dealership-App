import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/models/user_model.dart';
import 'package:vehicle_management/providers/auth_provider.dart';

class TopLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<AuthProvider>(context).user;
    return
        // Icon(
        //   Icons.location_on,
        //   color: kPrimary,
        //   size: 22,
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        // Text(
        //   'Nairobi, Kenya',
        //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        // ),
        user != null
            ? Text(
                'Hey, ${(user.fullName.split(' '))[0]}',
                style:
                    kText.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
              )
            : Text(
                'Hey, there',
                style:
                    kText.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
              );
  }
}
