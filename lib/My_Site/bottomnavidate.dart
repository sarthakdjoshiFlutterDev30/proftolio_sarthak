import 'package:flutter/material.dart';
import 'package:protfolio_sarthak/My_Site/Portfolio_Page.dart';
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

  Future<bool> _onWillPop() async {
    if (widget.selectedindex == 0) {
      return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Exit"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Yes"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        widget.selectedindex = 0; // Set selected index to 0 (Home)
      });
      return false; // Do not allow back button to pop the current screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[widget.selectedindex],
      bottomNavigationBar: WillPopScope(
        onWillPop: _onWillPop,
        child: BottomNavigationBar(
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
              icon: Icon(Icons.self_improvement),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.link),
              label: 'Link',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Hire Me',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline),
              label: 'Project',
            ),
          ],
        ),
      ),
    );
  }
}
