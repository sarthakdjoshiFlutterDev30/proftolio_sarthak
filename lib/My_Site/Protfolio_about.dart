import 'package:flutter/material.dart';

class Protfolio_About extends StatefulWidget {
  const Protfolio_About({super.key});

  @override
  State<Protfolio_About> createState() => _Protfolio_AboutState();
}

class _Protfolio_AboutState extends State<Protfolio_About> {
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
                        fontSize: MediaQuery.of(context).size.width * 0.06,
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
                      'Passionate Flutter Developer | Crafting Engaging Cross-Platform Experiences | Innovating in Mobile App Development',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
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
                        fontSize: MediaQuery.of(context).size.width * 0.06,
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
                      'As a highly skilled Flutter developer from Bhavnagar, I am driven by a passion for creating innovative and user-friendly mobile applications. I have honed my skills and expertise in developing cutting-edge solutions for a diverse range of clients.\n\n'
                          'My journey in the field of mobile app development began with a keen interest in technology and coding. Over the years, I have continuously upgraded my skills and knowledge to keep up with the ever-evolving industry. My proficiency in Flutter, a cross-platform development framework, allows me to create robust and high-performing apps for both Android and iOS platforms.\n\n'
                          'I am a detail-oriented and results-driven professional, who thrives in fast-paced and challenging environments. With a strong background in software engineering, I possess a deep understanding of the entire app development lifecycle, from conceptualization to deployment. I am well-versed in agile methodologies and have a proven track record of delivering projects within tight deadlines while maintaining the highest quality standards.\n\n'
                          'Apart from my technical skills, I am a great team player and possess excellent communication skills. I believe in collaborating with my colleagues and clients to understand their requirements and deliver solutions that meet their expectations. My ability to adapt to new technologies and think outside the box has helped me.',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.035,
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
