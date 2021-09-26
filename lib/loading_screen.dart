import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: size.width,
          child: Lottie.asset(
            'assets/loading.json',
          ),
        ),
      ),
    );
  }
}
