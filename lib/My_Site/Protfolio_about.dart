import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_Hireme.dart';

class Protfolio_About extends StatefulWidget {
  const Protfolio_About({super.key});

  @override
  State<Protfolio_About> createState() => _Protfolio_AboutState();
}

class _Protfolio_AboutState extends State<Protfolio_About> {
  final String aboutText = '''
I am a passionate Flutter developer with expertise in building beautiful, responsive, and high-performance mobile and web applications. With a strong foundation in software development and a keen eye for design, I create seamless user experiences that delight users.

My journey in app development started with a curiosity to understand how things work under the hood, which led me to explore various technologies and frameworks. I specialize in Flutter development and have experience working with various state management solutions, APIs, and Firebase services.

When I'm not coding, you can find me exploring new technologies, contributing to open-source projects, or sharing my knowledge with the developer community through blog posts and tutorials.
  ''';

  final List<Map<String, String>> skills = [
    {
      'icon': '📱',
      'title': 'Mobile Development',
      'subtitle': 'Flutter, Android, iOS'
    },
    {
      'icon': '🌐',
      'title': 'Web Development',
      'subtitle': 'Flutter Web, Responsive Design'
    },
    {
      'icon': '🔌',
      'title': 'APIs & Backend',
      'subtitle': 'REST, Firebase'
    },
    {
      'icon': '🎨',
      'title': 'UI/UX Design',
      'subtitle': 'Material Design'
    },
  ];

  final List<Map<String, String>> experience = [
    {
      'role': 'Flutter Developer Intern.',
      'company': 'Maxgen Technologies Private Limited',
      'duration': 'Jan 2024 - June 2024',
      'description':
          'Worked on various mobile applications, collaborating with designers and backend developers to deliver high-quality products.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header Section
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'About Me',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'asset/images/background.jpeg',
                    fit: BoxFit.cover,
                    color: Colors.black.withValues(alpha: 0.6),
                    colorBlendMode: BlendMode.darken,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About Section
                  Text(
                    'Who I Am',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    aboutText,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      height: 1.7,
                      color: colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 32),

                  // Skills Section
                  Text(
                    'My Skills',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.width > 800 ? 4 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: skills.length,
                    itemBuilder: (context, index) =>
                        _buildSkillCard(skills[index], context),
                  ),
                  const SizedBox(height: 32),

                  // Experience Section
                  Text(
                    'Experience',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...experience
                      .map((exp) => _buildExperienceCard(exp, context))
                      .toList(),
                  const SizedBox(height: 32),

                  // Contact Button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Protfolio_Hire(),));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      icon: const Icon(Icons.mail_outline),
                      label: const Text('Hire Me'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(Map<String, String> skill, BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              skill['icon']!,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 12),
            Text(
              skill['title']!,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              skill['subtitle']!,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard(Map<String, String> exp, BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  exp['role']!,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    exp['duration']!,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              exp['company']!,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              exp['description']!,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
