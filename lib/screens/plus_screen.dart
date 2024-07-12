import 'package:flutter/material.dart';

class PlusScreen extends StatelessWidget {
  const PlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("hello plus ",
          style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
