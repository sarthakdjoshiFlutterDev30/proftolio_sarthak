import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Protcolilo_Project extends StatefulWidget {
  const Protcolilo_Project({super.key});

  @override
  State<Protcolilo_Project> createState() => _Protcolilo_ProjectState();
}

class _Protcolilo_ProjectState extends State<Protcolilo_Project> {
  final List<String> links = [
    "https://github.com/sarthakdjoshiFlutterDev30/E-Commerce-Admin",
    "https://github.com/sarthakdjoshiFlutterDev30/E-Commerce-Users",
    "https://github.com/sarthakdjoshiFlutterDev30/expense_tracker",
    "https://github.com/sarthakdjoshiFlutterDev30/smart_attend",
    "https://github.com/sarthakdjoshiFlutterDev30/smart_attendance_student"
  ];
  final List<String> projectName = [
    "E-Commerce Admin App",
    "E-Commerce User App",
    "Expense-Tracker",
    "Smart-Attendance-Admin-App",
    "Smart-Attendance-Student-App"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Projects',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Click To Navigate Github Repository',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var abc = index + 1;
                return InkWell(
                  onTap: () {
                    launchURL(links[index]);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(abc.toString()),
                    ),
                    title: Text(projectName[index]),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 10,
              ),
              itemCount: links.length,
            ),
          ],
        ),
      ),
    );
  }

  launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $url';
    }
  }
}
