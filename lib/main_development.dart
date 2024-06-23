import 'dart:io';

import 'package:bilioteca_virtual/app/app.dart';
import 'package:bilioteca_virtual/app/modules/app_module.dart';
import 'package:bilioteca_virtual/bootstrap.dart';
import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupDependencies();

  await bootstrap(
    () {
      if (Platform.isAndroid || Platform.isIOS) {
        return ModularApp(module: AppModule(), child: const App());
      }

      return ModularApp(
        module: AppModule(),
        child: DevicePreview(
          builder: (context) {
            return const App();
          },
        ),
      );
    },
  );
}
