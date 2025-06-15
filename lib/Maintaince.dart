import 'package:flutter/material.dart';

class Maintaince extends StatefulWidget {
  const Maintaince({super.key});

  @override
  State<Maintaince> createState() => _MaintainceState();
}

class _MaintainceState extends State<Maintaince> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '🛠️ Site is under maintenance. Please check back later.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
