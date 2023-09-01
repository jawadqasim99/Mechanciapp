import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechanci/platte.dart';
import 'package:mechanci/screens/form.dart';
import 'package:mechanci/screens/loginscreen.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const MyLogin())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: Column(
            children: [
              Image.asset('assets/images/bal.png'),
              const SizedBox(
                height: 100,
              ),
              const Icon(
                Icons.dashboard,
                color: Platte.gradient2,
                size: 100,
              ),
              const SizedBox(
                height: 60,
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SaveForm()));
                },
                icon: const Icon(
                  Icons.contact_page_rounded,
                  color: Platte.whiteColor,
                  size: 25,
                ),
                label: const Text(
                  'Fill Details',
                  style: TextStyle(
                      color: Platte.whiteColor, fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 100),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(
                          color: Platte.borderColor,
                        ))),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton.icon(
            onPressed: () {
              signOut();
            },
            icon: const Icon(Icons.logout),
            label: const Text(
              "Log out",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 50),
                backgroundColor: Platte.gradient2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        )
      ]),
    );
  }
}
