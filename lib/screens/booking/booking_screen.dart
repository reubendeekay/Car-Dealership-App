import 'package:flutter/material.dart';
import 'package:vehicle_management/constants.dart';
import 'package:vehicle_management/screens/booking/booking_information.dart';
import 'package:vehicle_management/screens/booking/payment_screen.dart';

class BookingScreen extends StatefulWidget {
  static const routeName = '/booking-screen';
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          centerTitle: true,
          title: const Text(
            'BOOKING INFORMATION',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingInformation(),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'CONTACT INFORMATION',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              inputCard('Contact name'),
              inputCard('Email address'),
              Spacer(),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: kPrimary,
                    onPressed: () =>
                        Navigator.pushNamed(context, PaymentScreen.routeName),
                    child: const Text(
                      'Continue',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        )));
  }

  Widget inputCard(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
          maxLines: null,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            labelText: title,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                )),
          )),
    );
  }
}
