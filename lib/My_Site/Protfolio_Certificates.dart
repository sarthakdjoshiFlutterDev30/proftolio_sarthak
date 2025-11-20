import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProtfolioCertificates extends StatefulWidget {
  const ProtfolioCertificates({super.key});

  @override
  State<ProtfolioCertificates> createState() => _ProtfolioCertificatesState();
}

class _ProtfolioCertificatesState extends State<ProtfolioCertificates> {
  // List of certificates with title and description
  final List<Map<String, dynamic>> certificates = [
    {
      'image': "asset/images/Offer.letter_Sarthak_Joshi (Flutter)_page-0001.jpg",
      'title': 'Offer Letter',
      'description': 'Flutter Developer Position',
      'url': "https://drive.google.com/file/d/1uRCp8F-9nhSJEoBPTTCL0dAs4cQ28sU7/view?usp=drive_link",
    },
    {
      'image': "asset/images/Exp-Certificate.jpg",
      'title': 'Experience Certificate',
      'description': 'Flutter Developer',
      'url': "https://drive.google.com/file/d/1-YO6w29FuIBUq_p_uQ5u4j3FR85nLn5-/view?usp=drive_link",
    },
    {
      'image': "asset/images/LOR_Joshi_Sarthak_Flutter_page-0001.jpg",
      'title': 'Letter of Recommendation',
      'description': 'Flutter Development',
      'url': "https://drive.google.com/file/d/1PSkeNG029EyH-QgC_hQ91PSnG9FGyFu2/view?usp=drive_link",
    },
    {
      'image': "asset/images/SarthakJoshi_Resume_FlutterDeveloper_pages-to-jpg-0001.jpg",
      'title': 'Resume',
      'description': 'Flutter Developer',
      'url': "https://drive.google.com/file/d/1XZmkDo9ytGiotlPEnNwty-izISHbzgv_/view?usp=drive_link",
    },
    {
      'image': "asset/images/Sarthak_Joshi_Powerbi_Texhtip24_Certificate.jpg",
      'title': 'Power BI Certification',
      'description': 'TechTip 24',
      'url': "https://drive.google.com/file/d/103uwzKxorGottTwpzK_xrhgSbTrALUNw/view?usp=drive_link",
    },
    {
      'image': "asset/images/Accenture_page-0001.jpg",
      'title': 'Accenture Certification',
      'description': 'Industry Certification',
      'url': "https://drive.google.com/file/d/1--NSFCPQ8F14KtY-kBT4rEmhB6Tp7X6i/view?usp=sharing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Certifications',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemCount: certificates.length,
          itemBuilder: (context, index) {
            return _buildCertificateCard(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildCertificateCard(BuildContext context, int index) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final cert = certificates[index];

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _viewCertificate(cert['url']),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                cert['image'],
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 120,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cert['title'],
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cert['description'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => _viewCertificate(cert['url']),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text('View Certificate'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _viewCertificate(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch the URL')),
      );
    }
  }
}
