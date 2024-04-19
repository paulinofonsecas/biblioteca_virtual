import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExtention on BuildContext {
  void go(String location, {Object? extra}) =>
      GoRouter.of(this).go(location, extra: extra);
  Future<void> goReplacement(String location, {Object? extra}) =>
      GoRouter.of(this).pushReplacement(location, extra: extra);
}
