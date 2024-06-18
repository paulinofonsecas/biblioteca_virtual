import 'package:bilioteca_virtual/app/app.dart';
import 'package:bilioteca_virtual/bootstrap.dart';
import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupDependencies(); 

<<<<<<< HEAD
  await bootstrap(
    () => DevicePreview(
      builder: (context) {
        return const App();
      },
    ),
  );
=======
  await bootstrap(() => DevicePreview(
    builder: (context) {
      return const App();
    },
  ));
>>>>>>> b2248e0705493be7eec00680b6cafb005821164e
}
