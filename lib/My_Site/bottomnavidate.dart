import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio_sarthak/My_Site/Portfolio_Page.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_Certificates.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_Hireme.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_about.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_link.dart';

import 'Protfolio_Project.dart';

// ignore: must_be_immutable
class Bottomnavigate extends StatefulWidget {
  int selectedindex;

  Bottomnavigate({super.key, this.selectedindex = 0});

  @override
  State<Bottomnavigate> createState() => _BottomnavigateState();
}

class _BottomnavigateState extends State<Bottomnavigate> {
  List<Widget> screen = [
    const Protfolio_Page(),
    const ProtfolioCertificates(),
    const Protfolio_About(),
    Protfolio_Link(),
    const Protfolio_Hire(),
    const Protcolilo_Project()
  ];

  void ontap(int index) {
    setState(() {
      widget.selectedindex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[widget.selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        currentIndex: widget.selectedindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.certificate),
            label: 'Certificate',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.medal),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link),
            label: 'Link',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.hireAHelper),
            label: 'Hire Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Project',
          ),
        ],
      ),
    );
  }
}
