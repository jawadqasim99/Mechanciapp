import 'package:flutter/material.dart';
import 'package:mechanci/platte.dart';
import 'package:mechanci/screens/button.dart/login_field.dart';
import 'package:mechanci/screens/button.dart/signbutton.dart';
import 'package:mechanci/screens/loginscreen.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/bal.png'),
              const Text(
                'Forget Password',
                style: TextStyle(color: Platte.whiteColor, fontSize: 35),
              ),
              const SizedBox(
                height: 50,
              ),
              const LoginField(hintText: 'Email'),
              const SizedBox(
                height: 20,
              ),
              const LoginField(hintText: 'New Password'),
              const SizedBox(
                height: 20,
              ),
              const LoginField(hintText: 'Conform Password'),
              const SizedBox(
                height: 30,
              ),
              SignButton(
                lable: 'Conform',
                callback: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyLogin()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
