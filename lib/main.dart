import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mechanci/notification_firebase.dart';
import 'package:mechanci/platte.dart';

import 'package:mechanci/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
  await Notifications.intilize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Platte.backgroundColor,
      ),
      home: const SplshScreen(),
    );
  }
}
