import 'package:flutter/material.dart';
import 'package:mechanci/platte.dart';

class SignButton extends StatelessWidget {
  final String lable;
  final VoidCallback? callback;
  const SignButton({super.key, required this.lable, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: const LinearGradient(
            colors: [Platte.gradient1, Platte.gradient2, Platte.gradient3],
          )),
      child: ElevatedButton(
        onPressed: () {
          try {
            callback!();
          } catch (e) {
            (e);
          }
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(366, 60),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          lable,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
      ),
    );
  }
}
