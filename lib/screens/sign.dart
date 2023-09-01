import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechanci/platte.dart';

import 'package:mechanci/screens/button.dart/login_field.dart';
import 'package:mechanci/screens/button.dart/signbutton.dart';

// import 'package:mechanci/screens/loginscreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cureentpass = TextEditingController();
  String error = '';

  void getdata(context) async {
    String emailData = email.text.trim();
    String passText = password.text.trim();
    String currPassText = cureentpass.text.trim();
    if (emailData == '' || passText == '' || currPassText == '') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              titlePadding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
              backgroundColor: Platte.gradient2,
              title: const Text("Please Fill First"),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 223, 132, 248)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(color: Platte.whiteColor, fontSize: 17),
                  ),
                )
              ],
            );
          });
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailData, password: passText);

        if (userCredential.user != null) {
          Navigator.of(context).pop();
        }
      } on FirebaseAuthException catch (e) {
        error = e.code.toString();
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titlePadding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
                backgroundColor: Platte.gradient2,
                title: Text(error),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 223, 132, 248)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Platte.whiteColor, fontSize: 17),
                    ),
                  )
                ],
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/bal.png'),
              const Text(
                'Sign up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 50,
              ),
              LoginField(
                controlar: email,
                hintText: 'Email',
              ),
              const SizedBox(height: 20),
              LoginField(
                controlar: password,
                hintText: 'Password',
              ),
              const SizedBox(height: 20),
              LoginField(
                controlar: cureentpass,
                hintText: 'Conform Password',
              ),
              const SizedBox(height: 25),
              SignButton(
                lable: 'Sign up',
                callback: () {
                  getdata(context);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
