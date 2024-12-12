import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Protfolio_About extends StatefulWidget {
  const Protfolio_About({super.key});

  @override
  State<Protfolio_About> createState() => _Protfolio_AboutState();
}

class _Protfolio_AboutState extends State<Protfolio_About> {
  final double fontSize =
      kIsWeb ? 32 : (Platform.isAndroid || Platform.isIOS ? 23 : 32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Headline',
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Divider(height: 10, color: Colors.white),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.indigo,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Flutter Developer | Firebase & REST API Integration | Cross-Platform App Specialist | Data-Driven Problem Solver | Open to Opportunities",
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Divider(height: 10, color: Colors.white),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: Colors.indigo,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'As a highly skilled Flutter developer from Bhavnagar, I am driven by a passion for creating innovative and user-friendly mobile applications. My expertise lies in crafting high-performing apps that blend functionality with exceptional design, delivering impactful solutions for diverse clients.\n\n'
                          'My journey in mobile app development began with a fascination for technology and problem-solving. Over the years, I have honed my skills in Flutter, Dart, Firebase, and REST API integration, enabling me to create robust cross-platform applications for Android and iOS. I am also proficient with tools like Power BI and Razorpay payment gateway, further broadening the scope of my development capabilities.\n\n'
                          'With a strong foundation in software engineering, I excel at navigating the entire app development lifecycle—from ideation to deployment. I am detail-oriented, results-driven, and thrive in dynamic, fast-paced environments. My experience includes delivering real-time features such as audio/video calling and messaging, showcased in my e-commerce platforms, chat apps, and college management systems.\n\n'
                          'Beyond my technical skills, I am an excellent collaborator with strong communication abilities. I work closely with clients and teammates to understand their requirements, ensuring solutions align with their expectations. My adaptability, innovative thinking, and commitment to quality make me a valuable contributor to any team.',
                      style: TextStyle(
                        fontSize: fontSize,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
