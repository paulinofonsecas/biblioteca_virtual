import 'package:flutter/material.dart';

class AuthorHeaderWidget extends StatelessWidget {
  const AuthorHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black38,
            Colors.black12,
          ],
        ),
      ),
      child: Row(
        children: [
          BackButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
          ),
          Text(
            'Detalhes do autor',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
