import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tmpdbmoovieapp/widgets/bottom_nav_bar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavBar()),
      );
    });

    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/netflix.json"),
      ),
    );
  }
}
