import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/providers/auth_provider.dart';

class DashboardTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      // height: size.height * 0.3,
      color: kPrimary,
      child: Column(
        children: [
          SizedBox(
            height: 30 + MediaQuery.of(context).padding.top,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                  child: Text(
                    'Dashboard',
                    style: GoogleFonts.barlow(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Consumer<AuthProvider>(
                  builder: (context, auth, _) => Container(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: auth.user.imageUrl != null
                          ? NetworkImage(auth.user.imageUrl)
                          : AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.white,
              height: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BalanceWidget('Wallet Balance', 'Ksh. 1,126,788'),
                BalanceWidget('Cars in stock', '40'),
                BalanceWidget('Staff', '25'),
                SizedBox(
                  width: size.width * 0.1,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.white,
              height: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                DashboardTopCard(),
                DashboardTopCard(),
                DashboardTopCard(),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  final String title;
  final String quantity;
  BalanceWidget(this.title, this.quantity);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            quantity,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class DashboardTopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 200,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '5',
                  style: GoogleFonts.barlow(
                    color: kPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Flexible(child: Text('Total number of users in the app'))
              ],
            ),
          ),
        ),
        Icon(
          Icons.people,
          color: kPrimary.withOpacity(0.2),
          size: 60,
        )
      ]),
    );
  }
}
