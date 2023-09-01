import 'package:flutter/material.dart';
import 'package:mechanci/platte.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controlar;
  const LoginField({super.key, required this.hintText, this.controlar});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 370),
      child: TextField(
        controller: controlar,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Platte.borderColor, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Platte.gradient2, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Platte.whiteColor)),
      ),
    );
  }
}
