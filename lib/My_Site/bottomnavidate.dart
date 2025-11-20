import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protfolio_sarthak/My_Site/Portfolio_Page.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_Certificates.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_Hireme.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_about.dart';
import 'package:protfolio_sarthak/My_Site/Protfolio_link.dart';
import 'Protfolio_Project.dart';

// ignore: must_be_immutable
class Bottomnavigate extends StatefulWidget {
  int selectedindex;

  Bottomnavigate({super.key, this.selectedindex = 0});

  @override
  State<Bottomnavigate> createState() => _BottomnavigateState();
}

class _BottomnavigateState extends State<Bottomnavigate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = const [
    Protfolio_Page(),
    ProtfolioCertificates(),
    Protfolio_About(),
    Protfolio_Link(),
    Protfolio_Hire(),
    Protcolilo_Project(),
  ];

  final List<_NavItem> _navItems = const [
    _NavItem(label: 'Home', icon: Icons.home_outlined),
    _NavItem(label: 'Certificates', icon: Icons.verified_outlined),
    _NavItem(label: 'About', icon: Icons.person_outline),
    _NavItem(label: 'Links', icon: Icons.link_outlined),
    _NavItem(label: 'Hire', icon: Icons.work_outline),
    _NavItem(label: 'Projects', icon: Icons.list_alt_outlined),
  ];

  void _handleNavigation(int index) {
    if (index == widget.selectedindex) return;
    setState(() {
      widget.selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _NavigationDrawer(
        currentIndex: widget.selectedindex,
        items: _navItems,
        onItemSelected: (index) {
          Navigator.of(context).pop();
          _handleNavigation(index);
        },
      ),
      appBar: _TopNavBar(
        currentIndex: widget.selectedindex,
        items: _navItems,
        onItemSelected: _handleNavigation,
        onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[widget.selectedindex],
      ),
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

class _TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const _TopNavBar({
    required this.currentIndex,
    required this.items,
    required this.onItemSelected,
    required this.onMenuTap,
  });

  final int currentIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onItemSelected;
  final VoidCallback onMenuTap;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      elevation: 2,
      color: theme.scaffoldBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 720;
            return Container(
              height: preferredSize.height,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    'Sarthak.dev',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.primary,
                    ),
                  ),
                  if (!isCompact) ...[
                    const SizedBox(width: 48),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          for (var i = 0; i < items.length; i++) ...[
                            _NavBarButton(
                              label: items[i].label,
                              isSelected: i == currentIndex,
                              onTap: () => onItemSelected(i),
                            ),
                            if (i != items.length - 1) const SizedBox(width: 8),
                          ],
                        ],
                      ),
                    ),
                  ] else ...[
                    const Spacer(),
                    IconButton(
                      onPressed: onMenuTap,
                      icon: const Icon(Icons.menu_rounded),
                      tooltip: 'Open navigation',
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor:
            isSelected ? colorScheme.primary : colorScheme.onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        textStyle: GoogleFonts.poppins(
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      child: Text(label),
    );
  }
}

class _NavigationDrawer extends StatelessWidget {
  const _NavigationDrawer({
    required this.currentIndex,
    required this.items,
    required this.onItemSelected,
  });

  final int currentIndex;
  final List<_NavItem> items;
  final ValueChanged<int> onItemSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Text(
                'Navigate',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final selected = index == currentIndex;
                  return ListTile(
                    leading: Icon(
                      item.icon,
                      color: selected ? colorScheme.primary : null,
                    ),
                    title: Text(
                      item.label,
                      style: GoogleFonts.poppins(
                        fontWeight:
                            selected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                    selected: selected,
                    selectedTileColor:
                        colorScheme.primary.withValues(alpha: 0.08),
                    onTap: () => onItemSelected(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
