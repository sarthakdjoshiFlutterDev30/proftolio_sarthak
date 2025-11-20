import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Protfolio_Link extends StatelessWidget {
  const Protfolio_Link({super.key});

  static const List<_LinkInfo> _links = [
    _LinkInfo(
      title: 'GitHub',
      subtitle: 'sarthakdjoshiFlutterDev30',
      url: 'https://github.com/sarthakdjoshiFlutterDev30',
      assetPath: 'asset/images/github.png',
    ),
    _LinkInfo(
      title: 'LinkedIn',
      subtitle: 'sarthak-joshi-91724019b',
      url: 'https://www.linkedin.com/in/sarthak-joshi-91724019b/',
      assetPath: 'asset/images/linkedin.png',
    ),
    _LinkInfo(
      title: 'Email',
      subtitle: 'dev.sarthak0001@gmail.com',
      url: 'mailto:dev.sarthak0001@gmail.com',
      assetPath: 'asset/images/gmail.png',
    ),
    _LinkInfo(
      title: 'Discord',
      subtitle: 'Project updates & community',
      url: 'https://discord.com/channels/870179011073036380/1287652523460661319',
      assetPath: 'asset/images/Discord.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect With Me'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24),
        itemCount: _links.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final link = _links[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(link.assetPath),
                backgroundColor: colorScheme.surface,
              ),
              title: Text(
                link.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                link.subtitle,
                style: GoogleFonts.poppins(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontSize: 14,
                ),
              ),
              trailing: Icon(
                Icons.open_in_new_rounded,
                color: colorScheme.primary,
              ),
              onTap: () => _launchLink(link.url, context),
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchLink(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open the link')),
      );
    }
  }
}

class _LinkInfo {
  const _LinkInfo({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.assetPath,
  });

  final String title;
  final String subtitle;
  final String url;
  final String assetPath;
}
