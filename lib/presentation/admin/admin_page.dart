import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/view/authors_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/view/gestao_de_books_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with TickerProviderStateMixin {
  int _bottomNavIndex = 0;
  late final PageController _pageController;

  // floating action button icons
  final iconList = <IconData>[
    FontAwesomeIcons.book,
    FontAwesomeIcons.user,
    FontAwesomeIcons.bookAtlas,
    Icons.settings,
  ];

  // Screens
  final _screens = [
    const GestaoDeBooksPage(),
    const AuthorsPage(),
    Container(color: Colors.blueGrey),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTapNav(int index) {
    setState(() {
      _bottomNavIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => _bottomNavIndex = index);
          },
          children: _screens,
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        backgroundColor: Colors.black,
        onPressed: () {
          context.go(Uri(path: '/admin/add-new-book').toString());
        },
        child: const Icon(
          Icons.add,
          color: Colors.amber,
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
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
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: _onTapNav,
        );
      },
    );
  }
}
