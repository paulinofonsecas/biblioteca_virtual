import 'package:bilioteca_virtual/presentation/admin/features/authors/view/authors_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/view/gestao_de_books_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/view/home_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/profile/view/profile_page.dart';
import 'package:bilioteca_virtual/presentation/admin/widgets/admin_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with TickerProviderStateMixin {
  late final PageController _pageController;
  int bottomNavIndex = 0;

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

  final _screens = [
    const HomePage(),
    const AuthorsPage(),
    const GestaoDeBooksPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
      ),
      bottomNavigationBar: AdminNavigationWidget(
        pageController: _pageController,
        bottomNavIndex: bottomNavIndex,
        onPageChanged: (int index) {
          setState(() {
            bottomNavIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: ![1, 2].contains(bottomNavIndex)
          ? null
          : FloatingActionButton(
              shape: const StadiumBorder(),
              backgroundColor: Colors.black,
              onPressed: () {
                switch (bottomNavIndex) {
                  case 1:
                    context.go(Uri(path: '/admin/authors').toString());
                  case 2:
                    context.go(Uri(path: '/admin/add-new-book').toString());
                  default:
                }
              },
              child: const Icon(
                Icons.add,
                color: Colors.amber,
              ),
            ),
    );
  }
}
