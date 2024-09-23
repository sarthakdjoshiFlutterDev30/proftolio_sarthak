import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Protfolio_Link extends StatelessWidget {
  Protfolio_Link({super.key});

  final List<String> links = [
    "https://github.com/sarthakdjoshi",
    "https://www.linkedin.com/in/sarthak-joshi-91724019b/",
    "mailto:joshisarthakdjoshi556@gmail.com",
    "https://discord.com/channels/870179011073036380/1287652523460661319"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  launchURL(links[0]);
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/images/github.png"),
                ),
                title: Text(links[0]),
              ),
              const Divider(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  launchURL(links[1]);
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/images/linkedin.png"),
                ),
                title: Text(links[1]),
              ),
              const Divider(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  launchURL(links[2]);
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/images/gmail.png"),
                ),
                title: const Text("joshisarthakdjoshi556@gmail.com"),
              ),
              const Divider(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  launchURL(links[3]);
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("asset/images/Discord.png"),
                ),
                title: const Text("All Project Info. In Discoed Channel"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
