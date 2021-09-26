import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:vehicle_management/constants.dart';

class ManageStaff extends StatelessWidget {
  static const String routeName = '/manage-staff';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Staff'),
        elevation: 0,
        // automaticallyImplyLeading: false
      ),
      body: SafeArea(
          child: ListView(
        children: [
          StaffCard(),
          StaffCard(),
          StaffCard(),
          StaffCard(),
          StaffCard(),
          StaffCard(),
          StaffCard(),
        ],
      )),
    );
  }
}

class StaffCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 10,
              spreadRadius: 3)
        ],
        color: Theme.of(context).primaryColor,
      ),
      child: Stack(
        children: [
          Row(children: [
            Container(
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: kPrimary,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Container(
                // height: 100,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Reuben Jefwa',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('Staff'),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.grey,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Container(
                            child: Text(
                              'reubenjefwa.com',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '0796660187',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      )
                    ]),
              ),
            )
          ]),
          Positioned(
            top: 5,
            right: 10,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
              splashRadius: 20,
            ),
          )
        ],
      ),
    );
  }
}
