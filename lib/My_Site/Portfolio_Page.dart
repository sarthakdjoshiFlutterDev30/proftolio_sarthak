import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Protfolio_Page extends StatefulWidget {
  const Protfolio_Page({super.key});

  @override
  State<Protfolio_Page> createState() => _Protfolio_PageState();
}

class _Protfolio_PageState extends State<Protfolio_Page> {
  List<Image> image = [
    Image.asset("asset/images/Flutter.png"),
    Image.asset("asset/images/Dart.png"),
    Image.asset("asset/images/Firebase.png"),
    Image.asset("asset/images/FCM.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Hello My Name Is Sarthak ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("asset/images/photo.jpg"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Skills : App Development, Web Development ",
                    style: TextStyle(color: Colors.white),
                  ),
                  ExpansionTile(
                    title: const Text(
                      "What Can I Do",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    children: [
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10.0,
                        children: [
                          for (var img in image)
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.width * 0.3,
                              child: img,
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.pinkAccent,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Resume",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: PageView(
                      children: [
                        Image.asset(
                          "asset/images/SarthakJoshi_Resume_FlutterDeveloper_pages-to-jpg-0001.jpg",
                          fit: BoxFit.contain,
                        ),
                        Image.asset(
                          "asset/images/SarthakJoshi_Resume_FlutterDeveloper_pages-to-jpg-0002.jpg",
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: ElevatedButton(
                        onPressed: () {
                          launchURL(
                              "https://drive.google.com/file/d/106c_XTF4ULyX5oKF7w2kwsONaMM31hu0/view?usp=drive_link");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        child: const Text(
                          "Download Resume",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Image.asset(
                      "asset/images/Exp-Certificate.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: ElevatedButton(
                        onPressed: () {
                          launchURL(
                              "https://drive.google.com/file/d/1-YO6w29FuIBUq_p_uQ5u4j3FR85nLn5-/view?usp=drive_link");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero)),
                        child: const Text(
                          "Download Experience Certificate",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
