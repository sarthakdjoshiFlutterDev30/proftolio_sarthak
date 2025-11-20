import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Protcolilo_Project extends StatelessWidget {
  const Protcolilo_Project({super.key});

  static const List<_ProjectInfo> _projects = [
    _ProjectInfo(
      title: 'E-Commerce Admin App',
      description:
          'Inventory management, advanced analytics and role-based controls built with Flutter and Firebase.',
      url: 'https://github.com/sarthakdjoshiFlutterDev30/E-Commerce-Admin',
      tags: ['Flutter', 'Firebase', 'Admin'],
    ),
    _ProjectInfo(
      title: 'E-Commerce User App',
      description:
          'Modern shopping experience with wishlist, payments, and push notifications.',
      url: 'https://github.com/sarthakdjoshiFlutterDev30/E-Commerce-Users',
      tags: ['Flutter', 'Payments', 'UX'],
    ),
    _ProjectInfo(
      title: 'Expense Tracker',
      description:
          'Personal finance assistant with charts, recurring reminders and offline-first sync.',
      url: 'https://github.com/sarthakdjoshiFlutterDev30/expense_tracker',
      tags: ['Flutter', 'SQflite', 'Charts'],
    ),
    _ProjectInfo(
      title: 'Smart Attendance (Admin)',
      description:
          'Attendance dashboard using QR codes, location awareness and real-time reports.',
      url: 'https://github.com/sarthakdjoshiFlutterDev30/smart_attend',
      tags: ['Flutter', 'QR', 'Firebase'],
    ),
    _ProjectInfo(
      title: 'Smart Attendance (Student)',
      description:
          'Student companion app that syncs with the admin portal for seamless check-ins.',
      url:
          'https://github.com/sarthakdjoshiFlutterDev30/smart_attendance_student',
      tags: ['Flutter', 'Student', 'Sync'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Portfolio'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highlighted Builds',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap any card to deep dive into the GitHub repository and explore commits, screenshots, and documentation.',
                    style: GoogleFonts.poppins(
                      color: colorScheme.onSurface.withValues(alpha: 0.75),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 900
                    ? 3
                    : MediaQuery.of(context).size.width > 600
                        ? 2
                        : 1,
                childAspectRatio: 0.95,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final project = _projects[index];
                  return _ProjectCard(
                    project: project,
                    onTap: () => _launchProject(project.url, context),
                  );
                },
                childCount: _projects.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchProject(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open repository')),
      );
    }
  }
}

class _ProjectInfo {
  const _ProjectInfo({
    required this.title,
    required this.description,
    required this.url,
    required this.tags,
  });

  final String title;
  final String description;
  final String url;
  final List<String> tags;
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.project,
    required this.onTap,
  });

  final _ProjectInfo project;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Featured build',
                  style: GoogleFonts.poppins(
                    color: colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                project.title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  project.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: colorScheme.onSurface.withValues(alpha: 0.75),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: project.tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        backgroundColor:
                            colorScheme.secondary.withValues(alpha: 0.12),
                        labelStyle: GoogleFonts.poppins(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'View on GitHub',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.open_in_new_rounded,
                    color: colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
