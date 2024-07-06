import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/author_background_widget.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/widgets/author_best_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

/// {@template author_details_body}
/// Body of the AuthorDetailsPage.
///
/// Add what it does
/// {@endtemplate}
class AuthorDetailsBody extends StatefulWidget {
  /// {@macro author_details_body}
  const AuthorDetailsBody({super.key});

  @override
  State<AuthorDetailsBody> createState() => _AuthorDetailsBodyState();
}

class _AuthorDetailsBodyState extends State<AuthorDetailsBody>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
          ),
          Stack(
            children: [
              const AuthorBackgroundWidget(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const _AuthorInfoWidget(),
                  _TabBar(tabController),
                  if (tabController.index == 0)
                    const AuthorBestBooks()
                  else
                    Container(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabBar extends StatefulWidget {
  const _TabBar(this.tabController);

  final TabController tabController;

  @override
  State<_TabBar> createState() => _TabBarState();
}

class _TabBarState extends State<_TabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      tabs: const [
        Tab(
          text: 'Livros',
          icon: Icon(Icons.book),
        ),
        Tab(
          text: 'Biografia',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}

class _AuthorInfoWidget extends StatelessWidget {
  const _AuthorInfoWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .5,
      child: const Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NameAndStars(),
                _FollowButton(),
              ],
            ),
            GutterLarge(),
            _ExtraInfo(),
          ],
        ),
      ),
    );
  }
}

class _FollowButton extends StatelessWidget {
  const _FollowButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Seguir'),
    );
  }
}

class _NameAndStars extends StatelessWidget {
  const _NameAndStars();

  @override
  Widget build(BuildContext context) {
    final autor = getIt<Author>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          autor.name,
          maxLines: 2,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow[700],
              size: 16,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
              size: 16,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
              size: 16,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
              size: 16,
            ),
            const Icon(
              Icons.star,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}

class _ExtraInfo extends StatelessWidget {
  const _ExtraInfo();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _MiniInfo(
          value: '10',
          title: 'Livros',
        ),
        _MiniInfo(
          value: '10K',
          title: 'Seguidores',
        ),
        // _MiniInfo(
        //   value: '10',
        //   title: 'Livros',
        // ),
      ],
    );
  }
}

class _MiniInfo extends StatelessWidget {
  const _MiniInfo({
    required this.value,
    required this.title,
  });

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
