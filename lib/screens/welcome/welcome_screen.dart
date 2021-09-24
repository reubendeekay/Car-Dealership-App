import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/screens/auth/auth_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                child: Lottie.asset(
              'assets/tutorial.json',
            )),
            Container(
                child: Lottie.asset(
              'assets/van.json',
            )),
            SizedBox(
              height: 45,
              width: size.width * 0.9,
              child: RaisedButton(
                color: kPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(AuthScreen.routeName),
                child: const Text(
                  'Get Started',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
