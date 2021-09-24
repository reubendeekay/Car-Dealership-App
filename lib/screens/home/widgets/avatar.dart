import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/models/user_model.dart';
import 'package:vehicle_management/providers/auth_provider.dart';

class UserAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<AuthProvider>(context).user;
    return Container(
      child: GestureDetector(
        onTap: () {
          ZoomDrawer.of(context).open();
        },
        child: CircleAvatar(
          backgroundImage: user.imageUrl != null
              ? CachedNetworkImageProvider(user.imageUrl)
              : AssetImage('assets/images/avatar.png'),
          radius: 20,
        ),
      ),
    );
  }
}
