import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminNavigationWidget extends StatefulWidget {
  const AdminNavigationWidget({
    required this.pageController,
    required this.onPageChanged,
    required this.bottomNavIndex,
    super.key,
  });

  final PageController pageController;
  final void Function(int value) onPageChanged;
  final int bottomNavIndex;

  @override
  State<AdminNavigationWidget> createState() => _AdminNavigationWidgetState();
}

class _AdminNavigationWidgetState extends State<AdminNavigationWidget> {
  // floating action button icons
  final iconList = <IconData>[
    FontAwesomeIcons.house,
    FontAwesomeIcons.user,
    FontAwesomeIcons.bookAtlas,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Icon(
              iconList[index],
              size: 24,
              color: isActive ? Colors.amber : Colors.grey,
            );
          },
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          activeIndex: widget.bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: widget.onPageChanged,
        );
      },
    );
  }
}
