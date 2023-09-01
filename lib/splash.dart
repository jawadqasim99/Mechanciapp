import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechanci/dashbord.dart';
// import 'package:mechanci/dashbord.dart';
import 'package:mechanci/platte.dart';
// import 'package:mechanci/screens/form.dart';
import 'package:mechanci/screens/loginscreen.dart';
// import 'package:mechanci/screens/loginscreen.dart';

class SplshScreen extends StatefulWidget {
  const SplshScreen({super.key});

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => (FirebaseAuth.instance.currentUser != null)
                  ? const MyHome()
                  : const MyLogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text.rich(TextSpan(children: [
        TextSpan(
            text: 'M', style: TextStyle(color: Platte.gradient2, fontSize: 50)),
        TextSpan(
            text: 'ECHANCI',
            style: TextStyle(color: Platte.gradient1, fontSize: 40))
      ]))),
    );
  }
}
