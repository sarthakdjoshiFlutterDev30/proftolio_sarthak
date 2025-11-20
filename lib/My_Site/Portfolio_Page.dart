import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'Protfolio_Hireme.dart';

class Protfolio_Page extends StatefulWidget {
  const Protfolio_Page({super.key});

  @override
  State<Protfolio_Page> createState() => _Protfolio_PageState();
}

class _Protfolio_PageState extends State<Protfolio_Page> {
  final List<Image> image = [
    Image.asset("asset/images/Flutter.png"),
    Image.asset("asset/images/Dart.png"),
    Image.asset("asset/images/Firebase.png"),
    Image.asset("asset/images/Flutter+SQFLite.png"),
    Image.asset("asset/images/BLoC.png"),
    Image.asset("asset/images/API-Integration.png"),
  ];

  String _getSkillName(int index) {
    switch (index) {
      case 0:
        return 'Flutter';
      case 1:
        return 'Dart';
      case 2:
        return 'Firebase';
      case 3:
        return 'SQFLite';
      case 4:
        return 'BLoC';
      case 5:
        return 'API Integration';
      default:
        return 'Skill';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          // Header Section
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width > 600 ? 48 : 24, 
                vertical: size.height * 0.1,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.08),
                    colorScheme.primary.withValues(alpha: 0.02),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, I\'m',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Sarthak Joshi',
                              style: GoogleFonts.poppins(
                                fontSize: size.width > 600 ? 56 : 42,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 16),
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  'Flutter Developer',
                                  textStyle: GoogleFonts.poppins(
                                    fontSize: size.width > 600 ? 28 : 24,
                                    color: colorScheme.secondary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  speed: const Duration(milliseconds: 80),
                                ),
                              ],
                              repeatForever: true,
                              pause: const Duration(seconds: 2),
                              displayFullTextOnTap: true,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: size.width > 800 ? size.width * 0.5 : size.width * 0.9,
                              child: Text(
                                'Passionate Flutter developer with expertise in building beautiful, responsive, and high-performance mobile and web applications. I turn ideas into reality with clean and efficient code.',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: colorScheme.onSurface.withValues(alpha: 0.8),
                                  height: 1.7,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Protfolio_Hire(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.colorScheme.primary,
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Contact Me',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                OutlinedButton(
                                  onPressed: () {
                                launchURL(
                            "https://drive.google.com/file/d/1XZmkDo9ytGiotlPEnNwty-izISHbzgv_/view?usp=drive_link"
                          );
                            },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    side: BorderSide(color: theme.colorScheme.primary),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Download CV',
                                    style: GoogleFonts.poppins(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (size.width > 800)
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Hero(
                            tag: 'profile-image',
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                                image: const DecorationImage(
                                  image: AssetImage("asset/images/photo.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          // Skills Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Skills',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.width > 600 ? 3 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: image[index],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _getSkillName(index),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          
          // Resume Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'My Resume',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 800, // Adjust based on your needs
                    child: PageView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              "asset/images/SarthakJoshi_Resume_FlutterDeveloper_pages-to-jpg-0001.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    if (kDebugMode) {
      print('Could not launch $url');
    }
  }
}
