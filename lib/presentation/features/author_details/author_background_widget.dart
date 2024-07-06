import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AuthorBackgroundWidget extends StatelessWidget {
  const AuthorBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final header = size.height * .5;

    return SizedBox(
      width: size.width,
      height: header,
      child: CachedNetworkImage(
        imageUrl:
            'https://images.unsplash.com/photo-1521133573892-e44906baee46?q=80&w=640&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        imageBuilder: (context, imageProvider) => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(image: imageProvider, fit: BoxFit.cover),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
