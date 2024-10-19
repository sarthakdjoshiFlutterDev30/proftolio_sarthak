import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProtfolioCertificates extends StatefulWidget {
  const ProtfolioCertificates({super.key});

  @override
  State<ProtfolioCertificates> createState() => _ProtfolioCertificatesState();
}

class _ProtfolioCertificatesState extends State<ProtfolioCertificates> {
  // List of image URLs for certificates
  List<String> imageUrls = [
    "asset/images/Exp-Certificate.jpg",
    "asset/images/LOR_Joshi_Sarthak_Flutter_page-0001.jpg",
    "asset/images/Sarthak_Joshi_Powerbi_Texhtip24_Certificate.jpg",
    "asset/images/Sarthak_Joshi_Powerbi_Greate_Leaning_Certificate_page-0001.jpg",
  ];

  // List of Google Drive URLs for certificates
  List<String> driveUrls = [
    // Resume
    "https://drive.google.com/file/d/1-YO6w29FuIBUq_p_uQ5u4j3FR85nLn5-/view?usp=drive_link", // Experience Certificate
    "https://drive.google.com/file/d/1PSkeNG029EyH-QgC_hQ91PSnG9FGyFu2/view?usp=drive_link", // Letter of Recommendation
    "https://drive.google.com/file/d/103uwzKxorGottTwpzK_xrhgSbTrALUNw/view?usp=drive_link", // Power BI Certificate Tech tip 24
    "https://drive.google.com/file/d/106HrmZ4flZQeDdni5c96XfjHil0XBEK_/view?usp=drive_link", // Power BI Certificate Great Learning
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Certificates"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8, // Adjust the height for medium size
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return index < 2
                ? _buildLargeCard(context, index)
                : _buildSmallCard(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildLargeCard(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrls[index],
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          InkWell(
            onTap: () => launchURL(driveUrls[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download, color: Colors.white),
                  Text(
                    'Download',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallCard(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrls[index],
              fit: BoxFit.cover,
              height: 1000, // Adjust the height as needed
              width: 700, // Adjust the width as needed
            ),
          ),
          InkWell(
            onTap: () => launchURL(driveUrls[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download, color: Colors.white),
                  Text(
                    'Download',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
