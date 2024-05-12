import 'package:bilioteca_virtual/presentation/client/features/home_page/view/home_page.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Custom App bar', () {
    testWidgets('renders CustomAppBar', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: CustomAppBar()));
      expect(find.byType(CustomAppBar), findsOneWidget);
    });

    group('Menu drawer button', () {
      testWidgets('renders DrawerButton', (tester) async {
        await tester.pumpWidget(const MaterialApp(home: CustomAppBar()));
        expect(find.byType(DrawerButton), findsOneWidget);
      });

      testWidgets('Open drawer by user click', (tester) async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));
        expect(find.byType(DrawerButton), findsOneWidget);
        await tester.tap(find.byType(DrawerButton));
        await tester.pump(const Duration(milliseconds: 300));
        expect(find.byType(DrawerHeader), findsOneWidget);
      });
    });
  });
}
