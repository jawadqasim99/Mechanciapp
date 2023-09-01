import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechanci/dashbord.dart';
import 'package:mechanci/screens/forgetscreen.dart';
// import 'package:mechanci/screens/form.dart';
import 'package:mechanci/platte.dart';
import 'package:mechanci/screens/button.dart/login_field.dart';
import 'package:mechanci/screens/button.dart/signbutton.dart';
import 'package:mechanci/screens/button.dart/social_button.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:mechanci/screens/sign.dart';
// import 'package:mechanci/screens/signup.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void getonline(context) async {
    String emailtext = email.text.trim();
    String passwordtext = password.text.trim();
    if (emailtext == '' || passwordtext == '') {
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
            .signInWithEmailAndPassword(
                email: emailtext, password: passwordtext);
        if (userCredential.user != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const MyHome())));
        }
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titlePadding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 70),
                backgroundColor: Platte.gradient2,
                title: Text(e.code.toString()),
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
                "Sign in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 50,
              ),
              const SocialButton(
                  path: 'assets/svgs/g_logo.svg',
                  lable: 'Continue With Google'),
              const SizedBox(
                height: 25,
              ),
              const SocialButton(
                path: 'assets/svgs/f_logo.svg',
                lable: 'Continue With Facebook',
                horizontalPadding: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "or",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 30),
              LoginField(
                controlar: email,
                hintText: 'Email',
              ),
              const SizedBox(height: 20),
              LoginField(
                controlar: password,
                hintText: 'Password',
              ),
              const SizedBox(height: 25),
              SignButton(
                lable: 'Sign in',
                callback: () {
                  getonline(context);
                },
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 380),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Platte.whiteColor,
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgetPage()));
                        },
                        child: const Text(
                          'Forget Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Platte.whiteColor,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
